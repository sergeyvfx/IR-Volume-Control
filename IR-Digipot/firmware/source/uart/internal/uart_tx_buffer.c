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

#include "uart/internal/uart_tx_buffer.h"

#include <string.h>

#include "base/algorithm.h"

void UART_TXBuffer_Initialize(UARTTXBuffer* tx_buffer,
                              char* buffer,
                              size_t buffer_size) {
  tx_buffer->buffer = buffer;
  tx_buffer->buffer_size = buffer_size;
  tx_buffer->start_data_index = 0;
  tx_buffer->used_data_size = 0;
}

static inline size_t GetWrappedDataIndexInBuffer(const UARTTXBuffer* tx_buffer,
                                                 size_t data_index) {
  return data_index % tx_buffer->buffer_size;
}

bool UART_TXBuffer_TryAppendChar(UARTTXBuffer* tx_buffer, char ch) {
  if (tx_buffer->used_data_size == tx_buffer->buffer_size) {
    return false;
  }

  // NOTE: Index is 0-based, that's why calculate position prior advancing the
  // used data size.
  const size_t char_index = GetWrappedDataIndexInBuffer(
      tx_buffer, tx_buffer->start_data_index + tx_buffer->used_data_size);
  tx_buffer->buffer[char_index] = ch;

  ++tx_buffer->used_data_size;

  return true;
}

size_t UART_TXBuffer_TryAppendBuffer(UARTTXBuffer* tx_buffer,
                                     const char* buffer,
                                     size_t length) {
  // Clamp length to available space in the transmission buffer.
  const size_t tx_buffer_available_length =
      tx_buffer->buffer_size - tx_buffer->used_data_size;
  if (tx_buffer_available_length == 0) {
    // Early output: the buffer is full.
    return 0;
  }

  // Denotes number of bytes which will be added to the transmission buffer.
  const size_t length_to_add = min_zz(length, tx_buffer_available_length);

  // Position of first unused character of data in the transmission buffer.
  const size_t tx_buffer_end_index = GetWrappedDataIndexInBuffer(
      tx_buffer, tx_buffer->start_data_index + tx_buffer->used_data_size);

  // Amount of bytes which can be written from the end of the existing data in
  // the buffer until the end of the buffer.
  const size_t tx_buffer_remainder_size =
      tx_buffer->buffer_size - tx_buffer_end_index;

  // Append new data from the current position up to the end of allocation.
  const size_t num_bytes_to_append_from_current =
      min_zz(length_to_add, tx_buffer_remainder_size);
  if (num_bytes_to_append_from_current != 0) {
    memcpy(tx_buffer->buffer + tx_buffer_end_index,
           buffer,
           num_bytes_to_append_from_current);
  }

  // If needed, wrap copy of new data to the beginning of the allocated buffer.
  const size_t num_bytes_to_append_from_start =
      length_to_add - num_bytes_to_append_from_current;
  if (num_bytes_to_append_from_current != 0) {
    memcpy(tx_buffer->buffer,
           buffer + num_bytes_to_append_from_current,
           num_bytes_to_append_from_start);
  }

  tx_buffer->used_data_size += length_to_add;

  return length_to_add;
}

size_t UART_TXBuffer_TryAppendString(UARTTXBuffer* tx_buffer, const char* str) {
  return UART_TXBuffer_TryAppendBuffer(tx_buffer, str, strlen(str));
}

char UART_TXBuffer_PopFront(UARTTXBuffer* tx_buffer) {
  if (UART_TXBuffer_IsEmpty(tx_buffer)) {
    return '\0';
  }

  const char result = tx_buffer->buffer[tx_buffer->start_data_index];

  tx_buffer->start_data_index =
      GetWrappedDataIndexInBuffer(tx_buffer, tx_buffer->start_data_index + 1);
  --tx_buffer->used_data_size;

  return result;
}
