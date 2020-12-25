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

#ifndef SPI_SOFTWARE_SPI_H_
#define SPI_SOFTWARE_SPI_H_

#include <stdbool.h>
#include <stdint.h>

// Software emulation of SPI bus protocol.
//
// Used for microcontrollers which either don't have SPI module or which SPI
// module is shared with other modules and those other modules are of a bigger
// interest to be implemented in hardware.

// Initialize software SPI implementation.
// Will configure all required ports.
void SPI_Initialize(void);

// Run periodic tasks related to the SPI communication.
void SPI_Tasks(void);

// Check whether SPI bus is busy with transmittion.
bool SPI_IsBusy(void);

// Transmit lower num_bits bits of the given value.
// The order of transmittion is MSB to LSB,
//
// Will return false if the SPI is currently busy.
// Otherwise will schedule the transmission and return truth.
//
// If number of bits is 0 then nothing happens and function returns truth.
bool SPI_Transmit(uint32_t data, uint8_t num_bits);

// Flush all SPI transmissions.
void SPI_Flush(void);

#endif  // SPI_SOFTWARE_SPI_H_
