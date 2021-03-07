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

#include "system/system.h"

#include <xc.h>

#include "chip/configuration.h"
#include "kernel/kernel.h"
#include "system/configuration.h"
#include "uart/uart.h"

static void OpenSystemUART() {
  UARTOptions uart_options;
  uart_options.baudrate = SYSTEM_UART_BAUDRATE;

  if (!UART_Open(&uart_options)) {
    KERNEL_Panic();
  }
}

void SYSTEM_Initialize() {
  // NOTE: Do not explicitly reset state of TRIS and PORT for UART TX/RX pins,
  // as this might cause transient changes in logic levels, which can be treated
  // as a beginning of data transmission.

  UART_Initialize();

  // Initialize port used for heartbeat.
  TRISAbits.RA0 = 0;

  OpenSystemUART();
}

void SYSTEM_Tasks(void) {
  // TODO(sergey): Consider making it more dynamic: allow subsystem to register
  // tasks they want to be run.

  LATAbits.LATA0 = 1;
  LATAbits.LATA0 = 0;

  UART_Tasks();
}
