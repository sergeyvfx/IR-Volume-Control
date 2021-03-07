# Copyright (c) 2020, Perseus authors
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

################################################################################
# Configure compiler flags to be used for external libraries detection.
#
# Main purpose of this is to remove any strict flags which might be passed to
# the try_compile() when detecting various libraries. Those strict flags might
# cause false-positive build failures and make CMake to follow wrong decisions.
#
# This is what was happening on macOS 10.15.4, Xcode 11.4, -Werror and
# -Wmissing-prototypes flag when detecting threading library. As one might
# have guessed, the test program does not ensure private visiibility of the
# test function, making compiler to generate missing-prototype warning which
# then gets escalated to error.
#
# This removes all strict flags wich could cause false-positives in compilation
# test failures, similar to how external libraries are treated.

backup_compiler_flags()
remove_strict_flags()

################################################################################
# Precompiled libraries tips and hints, for find_package().

include(precompiled_libs)

################################################################################
# Configure Threads

function(REPORT_THREADS THREADS)
  if(NOT IS_FIRST_RUN)
    return()
  endif()
  message(STATUS "Using ${THREADS} threading system")
endfunction()

find_package(Threads REQUIRED)
if(CMAKE_USE_PTHREADS_INIT)
  REPORT_THREADS("pthreads")
  set(THREADS_DEFINES -DTHREADS_MODEL_PTHREADS)
  set(THREADS_LIBS ${CMAKE_THREAD_LIBS_INIT})
elseif(CMAKE_USE_WIN32_THREADS_INIT)
  REPORT_THREADS("Win32")
  set(THREADS_DEFINES -DTHREADS_MODEL_WIN32)
  set(THREADS_LIBS ${CMAKE_THREAD_LIBS_INIT})
else()
  message(FATAL_ERROR "System doesn't have compatible threads!")
endif()

################################################################################
# Configure system-wide libraries

#########################
# Gflags

if(WITH_SYSTEM_GFLAGS)
  find_package(Gflags)
  if(NOT GFLAGS_FOUND)
    message(WARNING "System wide Gflags not found, falling back to bundled one")
    set(WITH_SYSTEM_GFLAGS OFF)
  endif()
endif()

if(NOT WITH_SYSTEM_GFLAGS)
  set(GFLAGS_DEFINES
    -DGFLAGS_DLL_DEFINE_FLAG=
    -DGFLAGS_DLL_DECLARE_FLAG=
    -DGFLAGS_DLL_DECL=
  )
  set(GFLAGS_NAMESPACE "gflags")
  set(GFLAGS_LIBRARIES extern_gflags)
  set(GFLAGS_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/gflags/src")
endif()

#########################
# Glog

if(WITH_SYSTEM_GLOG)
  find_package(Glog)
  if(NOT GLOG_FOUND)
    message(WARNING "System wide Glog not found, falling back to bundled one")
    set(WITH_SYSTEM_GLOG OFF)
  endif()
endif()

if(NOT WITH_SYSTEM_GFLAGS)
  set(GLOG_DEFINES
    -DGOOGLE_GLOG_DLL_DECL=
  )
  set(GLOG_LIBRARIES extern_glog)
  if(NOT WIN32)
    set(GLOG_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/glog/include")
  else()
    set(GLOG_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/glog/src/windows")
  endif()
endif()

# TODO(sergey): This is a workaround for buggy behavior of GTEST_IS_NULL_LITERAL_()
# when using Gcc-5
if(CMAKE_COMPILER_IS_GNUCC AND "${CMAKE_C_COMPILER_VERSION}" VERSION_LESS "6.0")
  list(APPEND GLOG_DEFINES
    -DGTEST_ELLIPSIS_NEEDS_POD_
  )
endif()

#########################
# Gtest

if(WITH_SYSTEM_GTEST)
  find_package(Gtest)
  if(NOT GTEST_FOUND)
    message(WARNING "System wide Gtest not found, falling back to bundled one")
    set(WITH_SYSTEM_GTEST OFF)
  else()
    if(GTEST_BUILD_FROM_SOURCE)
      include(ExternalProject)
      set(GTEST_CMAKE_ARGS
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
        -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
      )
      ExternalProject_Add(extern_src_googletest
        SOURCE_DIR "${GTEST_SOURCE_DIRECTORY}"
        BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/ext/build/gtest
        INSTALL_COMMAND ""
        CMAKE_ARGS "${GTEST_CMAKE_ARGS}"
      )
      ExternalProject_Get_Property(extern_src_googletest binary_dir)
      set(GTEST_LIBRARIES ${binary_dir}/libgtest.a)
      unset(binary_dir)
      unset(GTEST_CMAKE_ARGS)
    endif()
  endif()
endif()

if(NOT WITH_SYSTEM_GTEST)
  set(GTEST_LIBRARIES extern_gtest)
  set(GTEST_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/gtest/include")
endif()

#########################
# Gmock

if(WITH_SYSTEM_GMOCK)
  find_package(Gmock)
  if(NOT GMOCK_FOUND)
    message(WARNING "System wide Gmock not found, falling back to bundled one")
    set(WITH_SYSTEM_GMOCK OFF)
  endif()
endif()

if(NOT WITH_SYSTEM_GMOCK)
  set(GMOCK_LIBRARIES extern_gmock)
  set(GMOCK_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/external/gmock/include")
endif()

################################################################################
# Finalize.

restore_compiler_flags()
