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
  ../gtest/include
)

set(SRC
  # src/gmock-all.cc
  # src/gmock_main.cc

  src/gmock.cc
  src/gmock-cardinalities.cc
  src/gmock-internal-utils.cc
  src/gmock-matchers.cc
  src/gmock-spec-builders.cc
)

set(SRC_HEADERS
  include/gmock/gmock.h
  include/gmock/gmock-actions.h
  include/gmock/gmock-cardinalities.h
  include/gmock/gmock-function-mocker.h
  include/gmock/gmock-generated-actions.h
  include/gmock/gmock-generated-function-mockers.h
  include/gmock/gmock-generated-matchers.h
  include/gmock/gmock-matchers.h
  include/gmock/gmock-more-actions.h
  include/gmock/gmock-more-matchers.h
  include/gmock/gmock-nice-strict.h
  include/gmock/gmock-spec-builders.h
  include/gmock/internal/custom/gmock-generated-actions.h
  include/gmock/internal/custom/gmock-matchers.h
  include/gmock/internal/custom/gmock-port.h
  include/gmock/internal/gmock-internal-utils.h
  include/gmock/internal/gmock-port.h
  include/gmock/internal/gmock-pp.h
)

include_directories(${INC})
include_directories(SYSTEM ${INC_SYS})
add_library(extern_gmock "${SRC};${SRC_HEADERS}")
