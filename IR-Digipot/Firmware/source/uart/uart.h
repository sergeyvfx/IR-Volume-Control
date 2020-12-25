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

#ifndef UART_H_
#define UART_H_

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

// Module providing UART communication capabilities.
//
// TODO(sergey): Make this module properly asynchronous, so that, for example,
// transmission does not block system tasks.

// Initialize UART subsystem.
// Call it once during the system initialization stage.
void UART_Initialize(void);

typedef struct UARTOptions {
  // Baud rate. For example, 9600 or 115200.
  unsigned int baudrate;

  // TODO(sergey): Add options like synchronous/asynchronous operation mode,
  // interrupt mode for RX.
} UARTOptions;

// Open UART communication port.
// Returns truth on success.
bool UART_Open(UARTOptions* options);

// Flush UART buffers, making sure communication has finished.
// NOTE: The call is block for until the transmission is finished.
void UART_Flush(void);

// Write single char to the UART transmitter.
//
// NOTE: If the transmission buffer is full, the call is blocking for until
// there is enough space in the buffer.
//
// Returns truth on success.
bool UART_Write(char ch);

// Write buffer of a given size to the UART transmitter.
//
// NOTE: If the transmission buffer is full, the call is blocking for until
// there is enough space in the buffer.
//
// Returns truth on success.
bool UART_WriteBuffer(const char* str, size_t length);

// Write string to the UART transmitter.
//
// NOTE: If the transmission buffer is full, the call is blocking for until
// there is enough space in the buffer.
//
// Returns truth on success.
bool UART_WriteString(const char* str);

// Write single 8bit value in HEX form.
bool UART_WriteHexByte(uint8_t value);

// Run system tasks related on UART subsystem.
// This is where asynchronous transmission is happening.
void UART_Tasks(void);

#endif  // UART_H_
