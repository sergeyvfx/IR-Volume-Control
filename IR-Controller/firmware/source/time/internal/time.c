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

#include "time/time.h"

#include <xc.h>

#include "system/configuration.h"

void DelayMilliseconds(int milliseconds) {
  static const int max_delay_in_ms = 8;

  const int num_iterations = milliseconds / max_delay_in_ms;
  for (int i = 0; i < num_iterations; ++i) {
    __delay_ms(max_delay_in_ms);
  }

  // NOTE: XC8 expects a constant value passed to __delay_ms, so work it around
  // by loop which does fixed delay. This technically leads to longer delay than
  // requested.
  int delay_remainder = milliseconds % max_delay_in_ms;
  while (delay_remainder--) {
    __delay_ms(1);
  }
}
