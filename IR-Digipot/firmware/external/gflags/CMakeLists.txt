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
  src
  src/gflags
)

set(INC_SYS
)

set(SRC
  src/gflags.cc
  src/gflags_completions.cc
  src/gflags_reporting.cc
)

set(SRC_HEADERS
  src/gflags/defines.h
  src/gflags/gflags_completions.h
  src/gflags/gflags_declare.h
  src/gflags/gflags_gflags.h
  src/gflags/gflags.h
  src/config.h
  src/mutex.h
  src/util.h
)

if(WIN32)
  list(APPEND SRC
    src/windows_port.cc
  )
  list(APPEND SRC_HEADERS
    src/windows_port.h
  )
endif()

add_definitions(${GFLAGS_DEFINES})

include_directories(${INC})
include_directories(SYSTEM ${INC_SYS})
add_library(extern_gflags "${SRC};${SRC_HEADERS}")
