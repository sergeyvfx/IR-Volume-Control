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

#include "spi/software_spi.h"

#include <xc.h>

typedef enum SPIState {
  // SPI bus is on idle.
  IDLE,

  // Pull CS down to start the transmittion.
  SELECT_CHIP,

  // Perform data transmittion.
  TRANSMIT_DATA,

  // Pull CS down to stop the transmittion.
  DESELECT_CHIP,
} SPIState;

typedef struct SPIContext {
  SPIState state;

  uint32_t data;
  // Mask which indicates bit which will be tranmitted next.
  uint32_t bit_mask;
} SPIContext;

static SPIContext global_context;

////////////////////////////////////////////////////////////////////////////////
// SPI Context.

#define SPI_CLK LATCbits.LATC0
#define SPI_CS LATCbits.LATC1
#define SPI_SDO LATCbits.LATC2

static void CONTEXT_Initialize(SPIContext* context) {
  context->state = IDLE;
  context->bit_mask = 0;

  TRISCbits.TRISC0 = 0;
  TRISCbits.TRISC1 = 0;
  TRISCbits.TRISC2 = 0;

  SPI_CS = 1;
}

static void CONTEXT_Tasks(SPIContext* context) {
  switch (context->state) {
    case IDLE:
      // Nothing to do, no transmission to happen.
      break;

    case SELECT_CHIP:
      SPI_CS = 0;
      context->state = TRANSMIT_DATA;
      break;

    case TRANSMIT_DATA:
      SPI_SDO = (context->data & context->bit_mask) ? 1 : 0;
      SPI_CLK = 1;
      context->bit_mask >>= 1;
      if (context->bit_mask == 0) {
        context->state = DESELECT_CHIP;
      }
      SPI_CLK = 0;
      SPI_SDO = 0;
      break;

    case DESELECT_CHIP:
      SPI_CS = 1;
      context->state = IDLE;
      break;
  }
}

bool CONTEXT_IsBusy(SPIContext* context) {
  return context->state != IDLE;
}

bool CONTEXT_Transmit(SPIContext* context, uint32_t data, uint8_t num_bits) {
  if (num_bits == 0) {
    return true;
  }

  if (CONTEXT_IsBusy(context)) {
    return false;
  }

  context->data = data;
  context->bit_mask = ((uint32_t)1) << ((uint32_t)num_bits - 1);

  context->state = SELECT_CHIP;

  return true;
}

////////////////////////////////////////////////////////////////////////////////
// SPI System.

void SPI_Initialize(void) {
  CONTEXT_Initialize(&global_context);
}

void SPI_Tasks(void) {
  CONTEXT_Tasks(&global_context);
}

bool SPI_IsBusy(void) {
  return CONTEXT_IsBusy(&global_context);
}

bool SPI_Transmit(uint32_t data, uint8_t num_bits) {
  return CONTEXT_Transmit(&global_context, data, num_bits);
}

void SPI_Flush(void) {
  while (SPI_IsBusy()) {
    SPI_Tasks();
  }
}
