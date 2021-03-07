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
# - Find Gmock library
# Find the native Gmock includes and library
# This module defines
#  GMOCK_INCLUDE_DIRS, where to find Gmock/gmock.h, Set when Gmock is found.
#  GMOCK_LIBRARIES,    libraries to link against to use Gmock.
#  GMOCK_ROOT_DIR,     The base directory to search for Gmock.
#                      This can also be an environment variable.
#  GMOCK_FOUND, If false, do not try to use Gmock.
#
# also defined, but not for general use are
#  GMOCK_LIBRARY, where to find the Gmock library.

# If GMOCK_ROOT_DIR was defined in the environment, use it.
if(NOT GMOCK_ROOT_DIR AND NOT $ENV{GMOCK_ROOT_DIR} STREQUAL "")
  set(GMOCK_ROOT_DIR $ENV{GMOCK_ROOT_DIR})
endif()

set(_gmock_SEARCH_DIRS
  ${GMOCK_ROOT_DIR}
  /usr/local
  /sw # Fink
  /opt/local # DarwinPorts
  /opt/csw # Blastwave
  /opt/lib/gmock
  /opt/lib/gtest
)

find_path(GMOCK_INCLUDE_DIR
  NAMES
    gmock/gmock.h
  HINTS
    ${_gmock_SEARCH_DIRS}
  PATH_SUFFIXES
    include
)

find_library(GMOCK_LIBRARY
  NAMES
    gmock
  HINTS
    ${_gmock_SEARCH_DIRS}
  PATH_SUFFIXES
    lib64 lib
  )

# Handle the QUIETLY and REQUIRED arguments and set GMOCK_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  GMOCK DEFAULT_MSG
  GMOCK_LIBRARY
  GMOCK_INCLUDE_DIR
)

if(GMOCK_FOUND)
  set(GMOCK_LIBRARIES ${GMOCK_LIBRARY})
  set(GMOCK_INCLUDE_DIRS ${GMOCK_INCLUDE_DIR})
else()
  set(GMOCK_FOUND FALSE)
endif()

mark_as_advanced(
  GMOCK_INCLUDE_DIR
  GMOCK_LIBRARY
)
