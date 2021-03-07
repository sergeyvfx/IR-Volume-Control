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
//
// In derived from the oscillator configuration bits, PLL settings, frequency of
// an external crystal oscillator and so on.
#define FOSC_FREQ 48000000ul

// NOTE: The naming is a bit misleading. This define is used by macros like
// __delay_ms() to see how much to NOP. The calculation is to use the core
// frequency, not the frequency of the crystal oscillator.
#define _XTAL_FREQ FOSC_FREQ

////////////////////////////////////////////////////////////////////////////////
// UART.

// Baudrate at which UART module transmits and receives data.
#define SYSTEM_UART_BAUDRATE 9600

// Side of a buffer which is used to asynchronously transmit data.
//
// The idea the buffer is to allow system tasks to keep running while slow
// transmission is happening.
#define UART_BUFFER_SIZE 256

// Address of volume configuration in the EEPROM.
#define EEMPROM_ADDR_VOLUME 0x00

#endif  // SYSTEM_CONFIGURATION_H_
