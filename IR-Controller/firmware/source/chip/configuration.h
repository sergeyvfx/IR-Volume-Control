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

#ifndef CHIP_CONFIGURATION_H_
#define CHIP_CONFIGURATION_H_

// Configuration bits which will be flashes into the chip.
//
// NOTE: Some of the settings are related to settings from
// the system_configuration.h header. For example, if there are changes in PLL
// settings are made the core frequency is to be adjusted in the system
// configuration header.
//
// NOTE: This header is only expected to be included once (from any translation
// unit of the project).

// Ensure we have the correct target PIC device family.
// Ensure we have the correct target PIC device family.
#if !defined(__18LF2550)
#  error This firmware only was tested on PIC18LF2550 microcontrollers.
#endif

// CONFIG1L
#pragma config PLLDIV = 1
#pragma config CPUDIV = OSC1_PLL2
#pragma config USBDIV = 1

// CONFIG1H
#pragma config FOSC = INTOSC_EC
#pragma config FCMEN = OFF
#pragma config IESO = OFF

// CONFIG2L
#pragma config PWRT = OFF
#pragma config BOR = OFF
#pragma config BORV = 1
#pragma config VREGEN = OFF

// CONFIG2H
#pragma config WDT = OFF
#pragma config WDTPS = 32768

// CONFIG3H
#pragma config CCP2MX = OFF
#pragma config PBADEN = OFF
#pragma config LPT1OSC = ON
#pragma config MCLRE = OFF

// CONFIG4L
#pragma config STVREN = ON
#pragma config LVP = OFF
#pragma config XINST = OFF

// CONFIG5L
#pragma config CP0 = OFF
#pragma config CP1 = OFF
#pragma config CP2 = OFF
#pragma config CP3 = OFF

// CONFIG5H
#pragma config CPB = OFF
#pragma config CPD = OFF

// CONFIG6L
#pragma config WRT0 = OFF
#pragma config WRT1 = OFF
#pragma config WRT2 = OFF
#pragma config WRT3 = OFF

// CONFIG6H
#pragma config WRTC = OFF
#pragma config WRTB = OFF
#pragma config WRTD = OFF

// CONFIG7L
#pragma config EBTR0 = OFF
#pragma config EBTR1 = OFF
#pragma config EBTR2 = OFF
#pragma config EBTR3 = OFF

// CONFIG7H
#pragma config EBTRB = OFF

#endif  // CHIP_CONFIGURATION_H_
