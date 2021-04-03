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

#include "app/irencoder_rc6.h"

#include <stdint.h>
#include <xc.h>

#include "app/irencoder.h"
#include "system/configuration.h"

static void ConfigurePWM(void) {
  // 1. Set the PWM period by writing to the PR2 register.
  //
  //   PR2 = PWM Period / (4 * TOSC * (TMR2 Prescale Value)) - 1
  //   PR2 = Fosc / (4 * Fpwm * (TMR2 Prescale Value)) - 1

  // From formula above calculated for 36KHz PWM frequency, Tosc based on 8MHz
  // Fosc, TMR2 prescale value of 1.
  PR2 = 55;

  // 2. Set the PWM duty cycle by writing to the CCPRxL register and
  //    CCPxCON<5:4> bits.
  //
  //   (CCPRxL:CCPxCON<5:4>) = PWM Duty Cycle / (TOSC * (TMR2 Prescale Value))
  //
  // NOTE: Duty cycle is measured in time, not in percentage.

  // From formula above calculated for 30%, Tosc based on 8MHz
  // Fosc, TMR2 prescale value of 1.
  const uint16_t ccp_duty_cycle = 66;

  CCP1CONbits.DC1B = ccp_duty_cycle & 0b00000011;
  CCPR1L = (ccp_duty_cycle >> 2) & 0xff;

  // 3. Make the CCPx pin an output by clearing the appropriate TRIS bit.
  TRISCbits.RC2 = 0;

  // 4. Set the TMR2 prescale value, then enable Timer2 by writing to T2CON.

  T2CONbits.TOUTPS = 0;  // No post-scaler.
  T2CONbits.T2CKPS = 0;  // No pre-scaler.

  // NOTE: Delay Timer2 startup to Start_PWM, to allow code to turn PWM on and
  // off without full initialization every time.

  // 5. Configure the CCPx module for PWM operation.
  CCP1CONbits.CCP1M = 0b1100;
}

static void Start_PWM(void) {
  TMR2 = 0;
  T2CONbits.TMR2ON = 1;
  CCP1CONbits.CCP1M = 0b1100;
}

static void Stop_PWM(void) {
  // Restore CCP configuration to default (Capture/Compare/PWM off).
  //
  // NOTE: Seems that CCP is to be disabled to reliably stop the PWM and allow
  // the output pin to be known in the low state.
  CCP1CONbits.CCP1M = 0b0000;

  T2CONbits.TMR2ON = 0;  // Disable timer.
  LATCbits.LATC2 = 0;    // Force pin to be 0.
}

// Transmit bit with typical duration of 895us.
static inline void TransmitShortBit(uint8_t bit_value) {
  if (bit_value) {
    Start_PWM();
    __delay_us(447);
    Stop_PWM();
    __delay_us(447);
  } else {
    Stop_PWM();
    __delay_us(447);
    Start_PWM();
    __delay_us(447);
  }
}

// Transmit special bit with duration of 1.79ms.
static inline void TransmitLongBit(uint8_t bit_value) {
  if (bit_value) {
    Start_PWM();
    __delay_us(895);
    Stop_PWM();
    __delay_us(895);
  } else {
    Stop_PWM();
    __delay_us(895);
    Start_PWM();
    __delay_us(895);
  }
}

static inline void TransmitLeaderBit(void) {
  Start_PWM();
  __delay_us(2685);
  Stop_PWM();
  __delay_us(895);

  TransmitShortBit(1);
}

static inline void TransmitField(const uint8_t field) {
  TransmitShortBit(field & 0b00000100);
  TransmitShortBit(field & 0b00000010);
  TransmitShortBit(field & 0b00000001);
}

static inline void TransmitToggle(const uint8_t t) {
  TransmitLongBit(t);
}

static inline void TransmitUInt8(const uint8_t value) {
  TransmitShortBit(value & 0b10000000);
  TransmitShortBit(value & 0b01000000);
  TransmitShortBit(value & 0b00100000);
  TransmitShortBit(value & 0b00010000);
  TransmitShortBit(value & 0b00001000);
  TransmitShortBit(value & 0b00000100);
  TransmitShortBit(value & 0b00000010);
  TransmitShortBit(value & 0b00000001);
}

static inline void TransmitAddress(const uint8_t address) {
  TransmitUInt8(address);
}

static inline void TransmitCommand(const uint8_t command) {
  TransmitUInt8(command);
}

void IRENCODER_Transmit_RC6(const IRTransmission* transmission) {
  ConfigurePWM();

  TransmitLeaderBit();
  TransmitField(transmission->rc6.field);
  TransmitToggle(transmission->rc6.t);
  TransmitAddress(transmission->rc6.address);
  TransmitCommand(transmission->rc6.command);

  Stop_PWM();
}
