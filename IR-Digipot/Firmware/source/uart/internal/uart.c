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

#include "uart/uart.h"

#include <stdint.h>
#include <string.h>
#include <xc.h>

#include "kernel/kernel.h"
#include "system/configuration.h"
#include "uart/internal/uart_tx_buffer.h"

static char global_tx_buffer_data[UART_BUFFER_SIZE];
static UARTTXBuffer global_tx_buffer;

static const char lut_val_to_hex_char[16] = "0123456789ABCDEF";

////////////////////////////////////////////////////////////////////////////////
// Subsystem API.

void UART_Initialize(void) {
  UART_TXBuffer_Initialize(
      &global_tx_buffer, global_tx_buffer_data, sizeof(global_tx_buffer_data));
}

////////////////////////////////////////////////////////////////////////////////
// Internal helpers.

// Return truth if the UART transmitter is busy and can not be used to transmit
// at this time.
static inline bool TX_IsBusy(void) {
  return (bool)(TXSTAbits.TRMT == 0);
}

// Run single iteration of system tasks for the given transmission buffer.
// If the buffer is not empty and transmission is possible next character from
// the buffer is requested to be transmitted.
static inline void TX_Tasks(UARTTXBuffer* tx_buffer) {
  if (UART_TXBuffer_IsEmpty(tx_buffer)) {
    // Early output: Nothing to be transmitted.
    return;
  }
  if (TX_IsBusy()) {
    // Early output: Transmitted is busy, can not request transmission of the
    // next character.
    return;
  }

  const char ch = UART_TXBuffer_PopFront(tx_buffer);
  TXREG = ch;
}

// Flush entire buffer to the transmitter.
// The call is block for until the buffer if fully transmitted. The buffer is
// empty at the end of this function.
static inline void TX_Flush(UARTTXBuffer* tx_buffer) {
  while (!UART_TXBuffer_IsEmpty(tx_buffer)) {
    TX_Tasks(tx_buffer);
  }
}

// Partial flush, which allows to make enough space in the buffer for the new
// incoming data.
static inline void TX_FlushNumBytes(UARTTXBuffer* tx_buffer,
                                    size_t num_bytes_to_flush) {
  if (num_bytes_to_flush >= tx_buffer->used_data_size) {
    TX_Flush(tx_buffer);
    return;
  }

  size_t desired_buffer_size = tx_buffer->used_data_size - num_bytes_to_flush;
  while (tx_buffer->used_data_size > desired_buffer_size) {
    TX_Tasks(tx_buffer);
  }
}

////////////////////////////////////////////////////////////////////////////////
// UART communication API.

// Calculate SPBRG for the given baudrate.
// Uses TABLE 20-1: BAUD RATE FORMULAS from the PIC18F2550 datasheet.
//
// The scale is either 4, 16, or 64. This argument is used to see which are the
// best settings for the SPBRGH:SPBRG registers pair.
static unsigned int CalculateSPBRG(unsigned int baudrate, unsigned int scale) {
  // TODO(sergey): Since the scale is a power of two, can consider reworking
  // this internal API a bit and use right shift instead of division, in the
  // case it does help performance.
  return (unsigned int)((FOSC_FREQ / baudrate) / scale - 1);
}

// Configure baudrate registers BRGH. SPBRGH:SPBRG.
static bool ConfigureBaudrateRegisters(UARTOptions* options) {
  unsigned int spbrg_value;

  // Try the SPBRG for Low Baud Rate configuration if the value fits into the
  // register.
  spbrg_value = CalculateSPBRG(options->baudrate, 64);
  if (spbrg_value < 256) {
    SPBRG = (uint8_t)spbrg_value;
    TXSTAbits.BRGH = 0;
    return true;
  }

  // See if the configuration fits into the High Baud Rate configuration.
  spbrg_value = CalculateSPBRG(options->baudrate, 16);
  if (spbrg_value < 256) {
    SPBRG = (uint8_t)spbrg_value;
    TXSTAbits.BRGH = 1;
    return true;
  }

  // Configuration failed: can not represent desired baudrate within the core
  // frequency restrictions.

  return false;
}

bool UART_Open(UARTOptions* options) {
  if (!ConfigureBaudrateRegisters(options)) {
    return false;
  }

  // Configure TX/RX pin according to the TABLE 10-5: PORTC I/O SUMMARY
  // configuration from the PIC18F2550 datasheet.
  TRISCbits.RC6 = 0;
  TRISCbits.RC7 = 1;

  // Setting Asynchronous Mode, ie UART
  TXSTAbits.SYNC = 0;

  // Enables Serial Port.
  RCSTAbits.SPEN = 1;

  // Configure transmitter.
  TXSTAbits.TXEN = 1;  // Enable TX.
  TXIE = 0;            // Disable TX interrupts.

  // Configure receiver.
  RCSTAbits.CREN = 0;  // Disable Continuous Reception
  RCSTAbits.SREN = 0;  // Disable single receive.
  RCIE = 0;            // Disable RX interrupts.

  return true;
}

void UART_Flush(void) {
  TX_Flush(&global_tx_buffer);
}

bool UART_Write(char ch) {
  UARTTXBuffer* tx_buffer = &global_tx_buffer;

  if (!UART_TXBuffer_TryAppendChar(tx_buffer, ch)) {
    // TODO(sergey): Only flush single character.
    UART_Flush();
  }
  return UART_TXBuffer_TryAppendChar(tx_buffer, ch);
}

bool UART_WriteBuffer(const char* buffer, size_t length) {
  UARTTXBuffer* tx_buffer = &global_tx_buffer;

  size_t num_bytes_written = 0;
  size_t num_bytes_to_write = length;
  while (true) {
    const size_t num_new_bytes_written = UART_TXBuffer_TryAppendBuffer(
        tx_buffer, buffer + num_bytes_written, num_bytes_to_write);
    num_bytes_to_write -= num_new_bytes_written;
    num_bytes_written += num_new_bytes_written;
    if (num_bytes_to_write == 0) {
      break;
    }
    TX_FlushNumBytes(tx_buffer, num_bytes_to_write);
  }
  return true;
}

bool UART_WriteString(const char* str) {
  return UART_WriteBuffer(str, strlen(str));
}

bool UART_WriteHexByte(uint8_t value) {
  char buffer[5] = "0xXX";

  buffer[2] = lut_val_to_hex_char[(value >> 4) & 0xf];
  buffer[3] = lut_val_to_hex_char[value & 0xf];

  return UART_WriteBuffer(buffer, 4);
}

////////////////////////////////////////////////////////////////////////////////
// System tasks.

void UART_Tasks(void) {
  TX_Tasks(&global_tx_buffer);
}
