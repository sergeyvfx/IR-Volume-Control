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

#ifndef APP_IRDECODER_H_
#define APP_IRDECODER_H_

#include <stdbool.h>
#include <stdint.h>

// Protocol used by the remote to transmit data.
typedef enum IRProtocol {
  PROTOCOL_UNKNOWN,
  PROTOCOL_RC6,
} IRProtocol;

// Transmission definition.
// Provides higher level access to the transmission data from the remote.
typedef struct IRTransmission {
  // Protocol used by the remote.
  IRProtocol protocol;

  struct {
    uint8_t start_bit;
    uint8_t field;
    uint8_t t;
    uint8_t address;
    uint8_t command;
  } rc6;
} IRTransmission;

// Initialize infrared decoder subsystem.
// Will configure all required ports, timers, and interrupts.
void IRDECODER_Initialize(void);

// Run periodic tasks related to the infrared decoder.
void IRDECODER_Tasks(void);

// Run interrupt handler of the infrared decoder.
//
// It should be run from the main interrupt handler, without clearing port
// interrupt flag used by the decoder.
void IRDECODER_InterruptHandler(void);

// Try to get last received transmission.
// If there no transmission received since the previous pop command false is
// returned and the tranmission object is not modified.
bool IRDECODER_TryPopTransmission(IRTransmission* transmission);

#endif  // APP_IRDECODER_H_
