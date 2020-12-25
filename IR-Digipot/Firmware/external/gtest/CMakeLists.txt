# Copyright (c) 2018, ez authors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#
# Author: Sergey Sharybin (sergey.vfx@gmail.com)

set(INC
  .
  include
)

set(INC_SYS
)

set(SRC
  # src/gtest-all.cc
  # src/gtest_main.cc

  src/gtest.cc
  src/gtest-death-test.cc
  src/gtest-filepath.cc
  src/gtest-matchers.cc
  src/gtest-port.cc
  src/gtest-printers.cc
  src/gtest-test-part.cc
  src/gtest-typed-test.cc

  src/gtest-internal-inl.h
)

set(SRC_HEADERS
  include/gtest/gtest.h
  include/gtest/gtest_pred_impl.h
  include/gtest/gtest_prod.h
  include/gtest/gtest-death-test.h
  include/gtest/gtest-matchers.h
  include/gtest/gtest-message.h
  include/gtest/gtest-param-test.h
  include/gtest/gtest-printers.h
  include/gtest/gtest-spi.h
  include/gtest/gtest-test-part.h
  include/gtest/gtest-typed-test.h
  include/gtest/internal/custom/gtest.h
  include/gtest/internal/custom/gtest-port.h
  include/gtest/internal/custom/gtest-printers.h
  include/gtest/internal/gtest-death-test-internal.h
  include/gtest/internal/gtest-filepath.h
  include/gtest/internal/gtest-internal.h
  include/gtest/internal/gtest-param-util.h
  include/gtest/internal/gtest-port.h
  include/gtest/internal/gtest-port-arch.h
  include/gtest/internal/gtest-string.h
  include/gtest/internal/gtest-type-util.h
)

include_directories(${INC})
include_directories(SYSTEM ${INC_SYS})
add_library(extern_gtest "${SRC};${SRC_HEADERS}")
