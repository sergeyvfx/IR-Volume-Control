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

#include <xc.h>

#include "app/irencoder.h"
#include "system/configuration.h"
#include "time/time.h"

// TODO(sergey): In the final design there will be no need in alive flag: the uC
// will be waken up, it'll handle the transmission and go back to sleep.
static int flag;

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

  HEARTBEAT_LED_TRIS = 0;

  // TODO(sergey): In the final design keep all interrupts disabled until
  // entering the sleep.
  INTCONbits.INT0IF = 0;
  INTCONbits.INT0IE = 1;
  INTCONbits.GIE = 1;
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

  // Configure interrupt input pin as input.
  WAKE_INT_TRIS = 1;

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

  flag = 1;
  while (flag) {
    IRTransmission transmission;
    transmission.protocol = PROTOCOL_RC6;
    transmission.rc6.start_bit = 1;
    transmission.rc6.field = 0;
    transmission.rc6.t = 0;
    transmission.rc6.address = 0;
    transmission.rc6.command = 0x10;
    IRENCODER_Transmit(&transmission);

    HEARTBEAT_LED_LAT = 1;
    DelayMilliseconds(500);
    HEARTBEAT_LED_LAT = 0;
    DelayMilliseconds(500);
  }

  APP_ConfigureAndSleep();
}

void __interrupt() ISR(void) {
  flag = !flag;
  INTCONbits.INT0IF = 0;
}
