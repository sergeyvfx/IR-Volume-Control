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

#ifndef UART_TX_BUFFER_H_
#define UART_TX_BUFFER_H_

#include <stdbool.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct UARTTXBuffer {
  // Buffer which contains data which is scheduled for asynchronous
  // transmission.
  //
  // NOTE: Points to a buffer owned by an user of the transmission buffer.
  char* buffer;

  // Size of buffer.
  // Or the maximum possible of bufferred data.
  size_t buffer_size;

  // Index in the buffer array indicating beginning of data which is to be
  // transmitted.
  size_t start_data_index;

  // Side of data in bytes which is to be transmitted.
  size_t used_data_size;
} UARTTXBuffer;

// Initialize transmission buffer to the given storage and its size.
void UART_TXBuffer_Initialize(UARTTXBuffer* tx_buffer,
                              char* buffer,
                              size_t buffer_size);

// Returns truth if the buffer is empty (has no data which is still to be
// transmitted).
static inline bool UART_TXBuffer_IsEmpty(const UARTTXBuffer* tx_buffer) {
  return (bool)(tx_buffer->used_data_size == 0);
}

// Attempt to append character to the transmission buffer.
//
// If the buffer is full and char can not be added false is returned. Otherwise
// truth is returned.
bool UART_TXBuffer_TryAppendChar(UARTTXBuffer* tx_buffer, char ch);

// Attempt to append buffer of given length to the transmission buffer.
//
// Returns number of bytes added to the transmission buffer.
size_t UART_TXBuffer_TryAppendBuffer(UARTTXBuffer* tx_buffer,
                                     const char* buffer,
                                     size_t length);

// Attempt to append string to the transmission buffer.
//
// Returns number of bytes added to the transmission buffer.
size_t UART_TXBuffer_TryAppendString(UARTTXBuffer* tx_buffer, const char* str);

// Pop single character from the front of the transmission buffer.
// If the buffer is empty then behavior is undefined.
char UART_TXBuffer_PopFront(UARTTXBuffer* tx_buffer);

#ifdef __cplusplus
}
#endif

#endif  // UART_TX_BUFFER_H_
