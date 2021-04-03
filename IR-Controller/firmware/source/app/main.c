// Copyright (c) 2020, Sergey Sharybin
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
// Author: Sergey Sharybin (sergey.vfx@gmail.com)

#include <stdbool.h>
#include <xc.h>

#include "app/irencoder.h"
#include "system/configuration.h"
#include "time/time.h"

static void APP_ResetAllPortsToOutput0(void) {
  TRISA = 0;
  TRISB = 0;
  TRISC = 0;
  LATA = 0;
  LATB = 0;
  LATC = 0;
}

// Disable all interrupts.
void APP_DisableInterrupts(void) {
  INTCONbits.RBIE = 0;
  INTCONbits.TMR0IE = 0;
  INTCONbits.PEIE = 0;
  INTCONbits.INT0IE = 0;
  INTCONbits.GIE = 0;
}

// Configure the chip upon its startup or wake-up from sleep.
static void APP_ConfigureOnStartup(void) {
  // Configure for 8 MHz internal oscillator.
  OSCCONbits.IRCF = 0b111;

  APP_ResetAllPortsToOutput0();
  APP_DisableInterrupts();

  // Ensure debug pin is output and is 0.
  DEBUG_PIN_TRIS = 0;
}

typedef struct KeypadButton {
  int row;
  int column;
} KeypadButton;

// Special value which indicates none of the buttons are pressed.
static const KeypadButton kNullKeypadButton = {-1, -1};

static KeypadButton MakeKeypadButton(const int row, const int column) {
  KeypadButton button;
  button.row = row;
  button.column = column;
  return button;
}

static bool KeypadButtonEqual(const KeypadButton* a, const KeypadButton* b) {
  return a->row == b->row && a->column == b->column;
}

static bool IsNullKeypadButton(const KeypadButton* button) {
  return KeypadButtonEqual(button, &kNullKeypadButton);
}

#define CHECK_KEYPAD_BUTTON_AND_RETURN(row, column)                            \
  do {                                                                         \
    KEYPAD_ROW_##row##_LAT = 1;                                                \
    int num_pressed = 0;                                                       \
    for (int i = 0; i < 5; ++i) {                                              \
      if (KEYPAD_COLUMN_##column##_PORT) {                                     \
        ++num_pressed;                                                         \
      }                                                                        \
    }                                                                          \
    if (num_pressed >= 3) {                                                    \
      return MakeKeypadButton(row, column);                                    \
    }                                                                          \
  } while (false)

static KeypadButton APP_ReadKeypad(void) {
  // Columns are inputs.
  KEYPAD_COLUMN_0_TRIS = 1;

  // Rows are outputs, default to 0;
  KEYPAD_ROW_0_TRIS = 0;
  KEYPAD_ROW_0_LAT = 0;
  KEYPAD_ROW_1_TRIS = 0;
  KEYPAD_ROW_1_LAT = 0;

  CHECK_KEYPAD_BUTTON_AND_RETURN(0, 0);
  CHECK_KEYPAD_BUTTON_AND_RETURN(1, 0);

  return kNullKeypadButton;
}

#undef CHECK_KEYPAD_BUTTON_AND_RETURN

static IRTransmission CreateRC6IRTransmission(uint8_t address,
                                              uint8_t command) {
  IRTransmission transmission;
  transmission.protocol = PROTOCOL_RC6;
  transmission.rc6.start_bit = 1;
  transmission.rc6.field = 0;
  transmission.rc6.t = 0;
  transmission.rc6.address = address;
  transmission.rc6.command = command;
  return transmission;
}

// Handle the input from the keypad, if any.
static bool APP_HandleKeypadIteration(void) {
  const KeypadButton button = APP_ReadKeypad();
  if (IsNullKeypadButton(&button)) {
    return false;
  }

#define kNumRows 2
#define kNumCols 1

  if (button.row < 0 || button.row >= kNumRows || button.column < 0 ||
      button.column >= kNumCols) {
    // TODO(sergey): Indicate an error situation somehow.
    return false;
  }

  IRTransmission kTransmissions[kNumRows][kNumCols] = {
      {CreateRC6IRTransmission(0, 0x10)},  // [0, 0]: Volume Up.
      {CreateRC6IRTransmission(0, 0x11)},  // [1, 0]: Volume Down.
  };

  const IRTransmission* transmission =
      &kTransmissions[button.row][button.column];
  if (transmission->protocol != PROTOCOL_UNKNOWN) {
    IRENCODER_Transmit(transmission);
    return true;
  }

  return false;

#undef kNumRows
#undef kNumCols
}

static void APP_HandleKeypad(void) {
  while (APP_HandleKeypadIteration()) {
    DelayMilliseconds(100);
  }
}

// Configure the chip for minimal power draw during sleep, keeping required
// for wake-up peripherals running. At the end issue the SLEEP command.
static void APP_ConfigureAndSleep(void) {
  // Configure device to go to sleep on `SLEEP` instruction.
  OSCCONbits.IDLEN = 0;

  // Configure all multiplexed ADC pins (AN0 to AN12) as digital inputs.
  ADCON1bits.PCFG = 0b1111;

  // Disable internal pull-ups, avoiding current draw through them.
  INTCON2bits.RBPU = 1;

  // Configure all peripherals as outputs and latch it on 0, avoiding
  // unforeseen power draw from unconnected input pins.
  APP_ResetAllPortsToOutput0();

  // Disable USB transceiver.
  UTRDIS = 1;

  T1CONbits.T1OSCEN = 0;   // Disable Timer1 oscillator.
  HLVDCONbits.HLVDEN = 0;  // Disable High/Low-Voltage Detect Power Enable bit.

  // Configure keypad columns as interrupt inputs.
  KEYPAD_COLUMN_0_TRIS = 1;

  // Configure rows as outputs and latch them to 1.
  KEYPAD_ROW_0_TRIS = 0;
  KEYPAD_ROW_0_LAT = 1;
  KEYPAD_ROW_1_TRIS = 0;
  KEYPAD_ROW_1_LAT = 1;

  // Interrupt on raising edge.
  INTCON2bits.INTEDG0 = 1;

  // Only keep strictly necessary interrupt enabled.
  APP_DisableInterrupts();
  INTCONbits.INT0IF = 0;
  INTCONbits.INT0IE = 1;
  INTCONbits.GIE = 1;

  // Issue the sleep command.
  SLEEP();
}

void main(void) {
  APP_ConfigureOnStartup();

  APP_HandleKeypad();

  APP_ConfigureAndSleep();
}

void __interrupt() ISR(void) {
  INTCONbits.INT0IF = 0;
}
