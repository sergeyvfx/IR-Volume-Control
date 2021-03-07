// Copyright (c) 2020, Perseus authors
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

#include "test/test.h"

#include "uart/internal/uart_tx_buffer.h"

TEST(UARTTXBuffer, IsEmpty) {
  char buffer[1024];

  UARTTXBuffer tx_buffer;
  UART_TXBuffer_Initialize(&tx_buffer, buffer, sizeof(buffer));

  EXPECT_TRUE(UART_TXBuffer_IsEmpty(&tx_buffer));

  EXPECT_TRUE(UART_TXBuffer_TryAppendChar(&tx_buffer, '@'));
  EXPECT_FALSE(UART_TXBuffer_IsEmpty(&tx_buffer));
}

TEST(UARTTXBuffer, AppendCharAndPop) {
  char buffer[3];
  UARTTXBuffer tx_buffer;
  UART_TXBuffer_Initialize(&tx_buffer, buffer, sizeof(buffer));

  // Append first character.
  //
  // Buffer state before: ( ) [ ] [ ]
  // Buffer state after:  (@) [ ] [ ]
  {
    EXPECT_TRUE(UART_TXBuffer_TryAppendChar(&tx_buffer, '@'));
    EXPECT_EQ(tx_buffer.start_data_index, 0);
    EXPECT_EQ(tx_buffer.used_data_size, 1);
    EXPECT_EQ(tx_buffer.buffer[0], '@');
  }

  // Append second character.
  //
  // Buffer state before: (@) [ ] [ ]
  // Buffer state after:  (@) [#] [ ]
  {
    EXPECT_TRUE(UART_TXBuffer_TryAppendChar(&tx_buffer, '#'));
    EXPECT_EQ(tx_buffer.start_data_index, 0);
    EXPECT_EQ(tx_buffer.used_data_size, 2);
    EXPECT_EQ(tx_buffer.buffer[0], '@');
    EXPECT_EQ(tx_buffer.buffer[1], '#');
  }

  // Pop from the front.
  //
  // Buffer state before: (@) [#] [ ]
  // Buffer state after:  [ ] [ ] ( )
  {
    EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), '@');
    EXPECT_EQ(tx_buffer.start_data_index, 1);
    EXPECT_EQ(tx_buffer.used_data_size, 1);

    EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), '#');
    EXPECT_EQ(tx_buffer.start_data_index, 2);
    EXPECT_EQ(tx_buffer.used_data_size, 0);
  }

  // Append after pop, wrapping the allocation around.
  //
  // Buffer state before: [ ] [ ] ( )
  // Buffer state after:  [%] [ ] ($)
  {
    EXPECT_TRUE(UART_TXBuffer_TryAppendChar(&tx_buffer, '$'));
    EXPECT_EQ(tx_buffer.start_data_index, 2);
    EXPECT_EQ(tx_buffer.used_data_size, 1);
    EXPECT_EQ(tx_buffer.buffer[2], '$');

    EXPECT_TRUE(UART_TXBuffer_TryAppendChar(&tx_buffer, '%'));
    EXPECT_EQ(tx_buffer.start_data_index, 2);
    EXPECT_EQ(tx_buffer.used_data_size, 2);
    EXPECT_EQ(tx_buffer.buffer[0], '%');
  }

  // Pop through the wrapping.
  //
  // Buffer state before: [%] [ ] ($)
  // Buffer state after:  [ ] ( ) [ ]
  {
    EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), '$');
    EXPECT_EQ(tx_buffer.start_data_index, 0);
    EXPECT_EQ(tx_buffer.used_data_size, 1);

    EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), '%');
    EXPECT_EQ(tx_buffer.start_data_index, 1);
    EXPECT_EQ(tx_buffer.used_data_size, 0);
  }
}

TEST(UARTTXBuffer, AppendStringAndPop) {
  char buffer[3];
  UARTTXBuffer tx_buffer;
  UART_TXBuffer_Initialize(&tx_buffer, buffer, sizeof(buffer));

  // Append first character.
  //
  // Buffer state before: ( ) [ ] [ ]
  // Buffer state after:  (@) [ ] [ ]
  {
    EXPECT_EQ(UART_TXBuffer_TryAppendString(&tx_buffer, "@"), 1);
    EXPECT_EQ(tx_buffer.start_data_index, 0);
    EXPECT_EQ(tx_buffer.used_data_size, 1);
    EXPECT_EQ(tx_buffer.buffer[0], '@');
  }

  // Pop data, to allow testing wrapped copy.
  //
  // Buffer state before: (@) [ ] [ ]
  // Buffer state after:  [ ] ( ) [ ]
  {
    EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), '@');
    EXPECT_EQ(tx_buffer.start_data_index, 1);
    EXPECT_EQ(tx_buffer.used_data_size, 0);
  }

  // Copy string in a wrapped manner.
  //
  // Buffer state before: [ ] ( ) [ ]
  // Buffer state after:  [$] (@) [#]
  {
    EXPECT_EQ(UART_TXBuffer_TryAppendString(&tx_buffer, "@#$"), 3);
    EXPECT_EQ(tx_buffer.start_data_index, 1);
    EXPECT_EQ(tx_buffer.used_data_size, 3);
    EXPECT_EQ(tx_buffer.buffer[0], '$');
    EXPECT_EQ(tx_buffer.buffer[1], '@');
    EXPECT_EQ(tx_buffer.buffer[2], '#');
  }

  // Another pop data, to allow testing partial copy.
  //
  // Buffer state before: [$] (@) [#]
  // Buffer state after:  [$] [ ] (#)
  {
    EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), '@');
    EXPECT_EQ(tx_buffer.start_data_index, 2);
    EXPECT_EQ(tx_buffer.used_data_size, 2);
  }

  // Partial string copy.
  //
  // Buffer state before: [$] [ ] (#)
  // Buffer state after:  [$] [%] (#)
  {
    EXPECT_EQ(UART_TXBuffer_TryAppendString(&tx_buffer, "%^&"), 1);
    EXPECT_EQ(tx_buffer.start_data_index, 2);
    EXPECT_EQ(tx_buffer.used_data_size, 3);
    EXPECT_EQ(tx_buffer.buffer[0], '$');
    EXPECT_EQ(tx_buffer.buffer[1], '%');
    EXPECT_EQ(tx_buffer.buffer[2], '#');
  }
}

TEST(UARTTXBuffer, AppendStringAndPopStress) {
  char buffer[3];
  UARTTXBuffer tx_buffer;
  UART_TXBuffer_Initialize(&tx_buffer, buffer, sizeof(buffer));

  EXPECT_EQ(UART_TXBuffer_TryAppendString(&tx_buffer, "ABC"), 3);
  EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), 'A');

  EXPECT_EQ(UART_TXBuffer_TryAppendString(&tx_buffer, "DEF"), 1);
  EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), 'B');
  EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), 'C');
  EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), 'D');

  EXPECT_EQ(UART_TXBuffer_TryAppendString(&tx_buffer, "EFGH"), 3);
  EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), 'E');
  EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), 'F');
  EXPECT_EQ(UART_TXBuffer_PopFront(&tx_buffer), 'G');
}
