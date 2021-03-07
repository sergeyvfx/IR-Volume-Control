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
  ../gflags/src
)

set(INC_SYS
)

set(SRC
  src/demangle.cc
  src/logging.cc
  src/raw_logging.cc
  src/signalhandler.cc
  src/symbolize.cc
  src/utilities.cc
  src/vlog_is_on.cc
)

set(SRC_HEADERS
  src/demangle.h
  src/symbolize.h
  src/utilities.h

  src/config.h
  src/config_freebsd.h
  src/config_hurd.h
  src/config_linux.h
  src/config_mac.h

  src/base/commandlineflags.h
  src/base/googleinit.h
  src/base/mutex.h

  src/stacktrace.h
  src/stacktrace_generic-inl.h
  src/stacktrace_libunwind-inl.h
  src/stacktrace_powerpc-inl.h
  src/stacktrace_windows-inl.h
  src/stacktrace_x86_64-inl.h
  src/stacktrace_x86-inl.h
)

if(WIN32)
  list(APPEND SRC
    src/windows/port.cc
  )
  list(APPEND SRC_HEADERS
    src/windows/glog/raw_logging.h
    src/windows/glog/vlog_is_on.h
    src/windows/glog/logging.h
    src/windows/glog/log_severity.h
    src/windows/port.h
    src/windows/config.h
  )

  list(APPEND INC
    src/windows
  )
else()
  list(APPEND INC
    include
  )
  list(APPEND SRC_HEADERS
    include/glog/logging.h
    include/glog/log_severity.h
    include/glog/raw_logging.h
    include/glog/vlog_is_on.h
  )
endif()

add_definitions(${GFLAGS_DEFINES})
add_definitions(${GLOG_DEFINES})

include_directories(${INC})
include_directories(SYSTEM ${INC_SYS})
add_library(extern_glog "${SRC};${SRC_HEADERS}")
