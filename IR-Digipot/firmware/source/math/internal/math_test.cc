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

#include "math/math.h"

TEST(Math, AddClamped) {
  EXPECT_EQ(AddClamped(0, 0, 255), 0);
  EXPECT_EQ(AddClamped(0, 10, 255), 10);
  EXPECT_EQ(AddClamped(0, 255, 255), 255);
  EXPECT_EQ(AddClamped(10, 255, 255), 255);
  EXPECT_EQ(AddClamped(100, 200, 255), 255);
  EXPECT_EQ(AddClamped(100, 200, 150), 150);

  EXPECT_EQ(AddClamped(100, 10, 20), 20);
}

TEST(Math, SunbtractClamped) {
  EXPECT_EQ(SunbtractClamped(0, 0, 0), 0);
  EXPECT_EQ(SunbtractClamped(0, 10, 0), 0);
  EXPECT_EQ(SunbtractClamped(0, 10, 4), 4);
  EXPECT_EQ(SunbtractClamped(100, 10, 4), 90);
  EXPECT_EQ(SunbtractClamped(100, 50, 75), 75);

  EXPECT_EQ(SunbtractClamped(100, 10, 200), 200);
}
