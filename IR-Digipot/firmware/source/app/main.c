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

#include <stdbool.h>
#include <xc.h>

#include "app/indication.h"
#include "app/irdecoder.h"
#include "app/volume.h"
#include "spi/software_spi.h"
#include "system/system.h"
#include "time/time.h"
#include "uart/uart.h"

// TODO(sergey): Find better place for this.
__EEPROM_DATA(0, 0, 0, 0, 0, 0, 0, 0);

static void APP_Initialize(void) {
  SYSTEM_Initialize();
  IRDECODER_Initialize();
  INDICATION_Initialize();
  VOLUME_Initialize();
  SPI_Initialize();

  // TODO(sergey): Run minimum amount of tasks needed to properly restore
  // configuration of the digital pot.

  // Make sure all transient states are stabilized. For example, that UART TX is
  // properly pulled up.
  //
  // TODO(sergey): When using PL2303HX-based Serial-to-USB dongle from eBay
  // there is a specific transition pattern on the TX pin of the
  // microcontroller: voltage first is pulled down from around 3v and then is
  // quickly raised up to 5v Vcc. This is where serial terminal will think there
  // is an incoming data. This delay mitigates the issue and the only outcome of
  // it is a first rubbish character in the terminal. Either need some sort of
  // external pull-up or a logic gate to avoid such high-low-hight transition on
  // the TX pin.
  DelayMilliseconds(10);

  UART_WriteString("\r\n");
  UART_WriteString("System initialization finished.\r\n");
  UART_WriteString("\r\n");
  UART_WriteString("====================================\r\n");
  UART_WriteString("***            Perseus           ***\r\n");
  UART_WriteString("====================================\r\n");
  // TODO(sergey): Print software and hardware versions.
  UART_WriteString("\r\n");
}

static void APP_Tasks(void) {
  SYSTEM_Tasks();
  IRDECODER_Tasks();
  INDICATION_Tasks();
  VOLUME_Tasks();
  SPI_Tasks();
}

void __interrupt() APP_InterruptHigh(void) {
  IRDECODER_InterruptHandler();
  INDICATION_InterruptHandler();
  VOLUME_InterruptHandler();
}

static void APP_StartUp(void) {
  VOLUME_UpdateOnStartup();
}

void main(void) {
  APP_Initialize();
  APP_StartUp();

  while (1) {
    APP_Tasks();
  }
}
