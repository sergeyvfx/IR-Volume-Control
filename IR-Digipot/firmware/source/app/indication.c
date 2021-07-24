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

#include "app/indication.h"

#include <stdint.h>
#include <xc.h>

// Timer value which makes it to run at 99.29Hz.
#define TIMER1_VALUE 35322

static uint8_t global_led_counters[2] = {0, 0};
static const int global_num_leds = 2;

// Number of points to decrement from the value.
// The value is increased in the interrupt, and is subtracted from LED counters
// from the main routine.
static uint8_t num_decrement = 0;

static void INDICATION_InitializePorts(void) {
  TRISAbits.RA0 = 0;
  TRISAbits.RA1 = 0;

  LATAbits.LATA0 = 0;
  LATAbits.LATA1 = 0;
}

static void INDICATION_InitializeTimer(void) {
  PIE1bits.TMR1IE = 1;  // Enable Timer1 Overflow Interrupt.
  PIR1bits.TMR1IF = 0;

  // Set prescaler to 1:4.
  T1CONbits.T1CKPS0 = 0;
  T1CONbits.T1CKPS1 = 1;

  T1CONbits.T1OSCEN = 0;  // Timer1 oscillator is disabled.
  T1CONbits.T1SYNC = 1;   // Do not synchronize external clock input.

  // Timer1 Clock Source Select bit to Internal clock (Fosc/4)
  T1CONbits.TMR1CS = 0;

  TMR1 = TIMER1_VALUE;

  T1CONbits.TMR1ON = 1;  // Turn ON Timer1.

  INTCONbits.GIEH = 1;  // Enable Global Interrupt.
  INTCONbits.PEIE = 1;  // Peripheral Interrupt Enable bit (required for TMR2).
}

void INDICATION_Initialize(void) {
  INDICATION_InitializePorts();
  INDICATION_InitializeTimer();

  num_decrement = 0;
}

void INDICATION_Tasks(void) {
  if (num_decrement != 0) {
    for (int i = 0; i < global_num_leds; ++i) {
      if (global_led_counters[i] < num_decrement) {
        global_led_counters[i] = 0;
      } else {
        global_led_counters[i] -= num_decrement;
      }
    }

    num_decrement = 0;
  }

  LATAbits.LATA0 = (global_led_counters[0] != 0) ? 1 : 0;
  LATAbits.LATA1 = (global_led_counters[1] != 0) ? 1 : 0;
}

void INDICATION_InterruptHandler(void) {
  if (!PIR1bits.TMR1IF) {
    return;
  }

  if (num_decrement < 255) {
    ++num_decrement;
  }

  TMR1 = TIMER1_VALUE;

  PIR1bits.TMR1IF = 0;
}

void INDICATOR_FlashLED(int led_index) {
  if (led_index < 0 || led_index > global_num_leds) {
    return;
  }

  global_led_counters[led_index] = 10;
}
