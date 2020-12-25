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

#ifndef MATH_H_
#define MATH_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// Calculate current_value+delta in a way that result does not exceed the given
// maximum value.
inline uint8_t AddClamped(const uint8_t current_value,
                          const uint8_t delta,
                          const uint8_t max_value) {
  if (max_value < delta) {
    return max_value;
  }
  if (current_value > max_value - delta) {
    return max_value;
  }
  return current_value + delta;
}

// Calculate current_value-delta in a way that result does not be smaller than
// the given minimum value.
inline uint8_t SunbtractClamped(const uint8_t current_value,
                                const uint8_t delta,
                                const uint8_t min_value) {
  if (min_value > 255 - delta) {
    return min_value;
  }
  if (current_value < min_value + delta) {
    return min_value;
  }
  return current_value - delta;
}

inline uint8_t AddOrSubtractClamped(const uint8_t current_value,
                                    const int8_t delta,
                                    const uint8_t min_value,
                                    const uint8_t max_value) {
  if (delta < 0) {
    return SunbtractClamped(current_value, (uint8_t)(-delta), min_value);
  }
  return AddClamped(current_value, (uint8_t)delta, max_value);
}

#ifdef __cplusplus
}
#endif

#endif  // MATH_H_
