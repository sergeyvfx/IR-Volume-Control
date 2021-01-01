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

static int flag;

void main(void) {
  TRISA = 0;
  TRISB = 0;
  TRISC = 0;

  LATA = 0;
  LATB = 0;
  LATC = 0;

  UTRDIS = 1;

  ADCON1bits.PCFG = 0b1111;

  T1CONbits.T1OSCEN = 0;
  HLVDCONbits.HLVDEN = 0;

  TRISAbits.RA0 = 0;
  TRISBbits.RB0 = 1;

  OSCCONbits.IDLEN = 0;
  OSCCONbits.IRCF = 0b111;

  INTCON2bits.RBPU = 1;
  INTCON2bits.INTEDG0 = 1;

  INTCONbits.RBIE = 0;
  INTCONbits.TMR0IE = 0;
  INTCONbits.PEIE = 0;

  INTCONbits.INT0IF = 0;
  INTCONbits.INT0IE = 1;
  INTCONbits.GIE = 1;

  flag = 1;
  while (flag) {
    LATAbits.LATA0 = 1;
    DelayMilliseconds(500);
    LATAbits.LATA0 = 0;
    DelayMilliseconds(500);
  }
  SLEEP();
}

void __interrupt() ISR(void) {
  flag = !flag;
  INTCONbits.INT0IF = 0;
}
