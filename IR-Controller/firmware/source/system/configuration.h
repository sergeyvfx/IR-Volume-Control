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

#ifndef SYSTEM_CONFIGURATION_H_
#define SYSTEM_CONFIGURATION_H_

////////////////////////////////////////////////////////////////////////////////
// Core.

// Software side configuration of the board.
//
// Includes settings like at which frequency core is running, which
// communication ports are enabled and so on.
//
// NOTE: Some settings are living together from chip configuration bits from
// the chip_configuration.h header. For example, if there are changes in PLL
// settings are made the core frequency is to be adjusted in this header.

// Frequency at which the Fosc is running.
#define FOSC_FREQ 8000000ul

// NOTE: The naming is a bit misleading. This define is used by macros like
// __delay_ms() to see how much to NOP. The calculation is to use the core
// frequency, not the frequency of the crystal oscillator.
#define _XTAL_FREQ FOSC_FREQ

////////////////////////////////////////////////////////////////////////////////
// Keypad configuration.

// Columns are responsible for listening in the sleep mode.
#define KEYPAD_COLUMN_0_TRIS TRISBbits.RB0
#define KEYPAD_COLUMN_0_PORT PORTBbits.RB0

#define KEYPAD_ROW_0_TRIS TRISBbits.RB4
#define KEYPAD_ROW_0_LAT LATBbits.LATB4

#define KEYPAD_ROW_1_TRIS TRISBbits.RB5
#define KEYPAD_ROW_1_LAT LATBbits.LATB5

////////////////////////////////////////////////////////////////////////////////
// Debug pin.

#define DEBUG_PIN_TRIS TRISAbits.RA0
#define DEBUG_PIN_LAT LATAbits.LATA0

#endif  // SYSTEM_CONFIGURATION_H_
