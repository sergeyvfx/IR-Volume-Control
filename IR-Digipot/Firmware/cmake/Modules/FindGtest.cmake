# Copyright (c) 2018, Perseus authors
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
#
# - Find Gtest library
# Find the native Gtest includes and library
# This module defines
#  GTEST_INCLUDE_DIRS, where to find gtest/gtest.h, Set when Gtest is found.
#  GTEST_LIBRARIES,    libraries to link against to use Gtest.
#  GTEST_ROOT_DIR,     The base directory to search for Gtest.
#                      This can also be an environment variable.
#  GTEST_FOUND, If false, do not try to use Gtest.
#  GTEST_BUILD_FROM_SOURCE   Set to TRUE when OS expects you to keep care of
#                            building Gtest from provided sources.
#  GTEST_SOURCE_DIRECTORY    Directory where Gtest sources are.
#
# also defined, but not for general use are
#  GTEST_LIBRARY, where to find the Gtest library.

# If GTEST_ROOT_DIR was defined in the environment, use it.
if(NOT GTEST_ROOT_DIR AND NOT $ENV{GTEST_ROOT_DIR} STREQUAL "")
  set(GTEST_ROOT_DIR $ENV{GTEST_ROOT_DIR})
endif()

set(_gtest_SEARCH_DIRS
  ${GTEST_ROOT_DIR}
  /usr/local
  /sw # Fink
  /opt/local # DarwinPorts
  /opt/csw # Blastwave
  /opt/lib/gmock
  /opt/lib/gtest
)

find_path(GTEST_INCLUDE_DIR
  NAMES
    gtest/gtest.h
  HINTS
    ${_gtest_SEARCH_DIRS}
  PATH_SUFFIXES
    include
)

find_library(GTEST_LIBRARY
  NAMES
    gtest
  HINTS
    ${_gtest_SEARCH_DIRS}
  PATH_SUFFIXES
    lib64 lib
)

if(EXISTS "${GTEST_INCLUDE_DIR}" AND NOT "${GTEST_LIBRARY}" AND EXISTS "/usr/src/gtest/CMakeLists.txt")
  # Special case for Debian.
  message(STATUS "Using packaged Gtest, but compiling it from source")
  set(GTEST_SOURCE_DIRECTORY "/usr/src/gtest")
  set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
  set(GTEST_BUILD_FROM_SOURCE TRUE)
  set(GTEST_FOUND TRUE)
  message(STATUS "Found Gtest ${GTEST_INCLUDE_DIRS} ${GTEST_SOURCE_DIRECTORY}")
else()
  set(GTEST_BUILD_FROM_SOURCE FALSE)
  unset(GTEST_SOURCE_DIRECTORY)
  # Handle the QUIETLY and REQUIRED arguments and set GTEST_FOUND to TRUE if
  # all listed variables are TRUE
  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(
    GTEST DEFAULT_MSG
    GTEST_LIBRARY
    GTEST_INCLUDE_DIR
  )

  if(GTEST_FOUND)
    set(GTEST_LIBRARIES ${GTEST_LIBRARY})
    set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
  else()
    set(GTEST_FOUND FALSE)
  endif()
endif()

mark_as_advanced(
  GTEST_INCLUDE_DIR
  GTEST_LIBRARY
)
