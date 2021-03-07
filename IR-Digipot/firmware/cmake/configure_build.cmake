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
# Global generic CMake settings.

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

if(WIN32)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin/Debug)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/Release)
endif()

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

################################################################################
# Default build type.

# Set a default build type if none was specified.
set(default_build_type "Release")

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to '${default_build_type}' "
                 "as none was specified.")
  set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE
      STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui.
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

################################################################################
# Per-compiler configuration.

if(CMAKE_COMPILER_IS_GNUCXX)
  set(CMAKE_C_FLAGS
      "${CMAKE_C_FLAGS} -Wall -Wno-sign-compare -fno-strict-aliasing")
  set(CMAKE_CXX_FLAGS
      "${CMAKE_CXX_FLAGS} -Wall -Wno-sign-compare -fno-strict-aliasing")
elseif(CMAKE_C_COMPILER_ID MATCHES "Clang")
  set(CMAKE_C_FLAGS
      "${CMAKE_C_FLAGS} -Wall -Wno-sign-compare -fno-strict-aliasing")
  set(CMAKE_CXX_FLAGS
      "${CMAKE_CXX_FLAGS} -Wall -Wno-sign-compare -fno-strict-aliasing")
endif()

################################################################################
# Strict flags.

if(CMAKE_COMPILER_IS_GNUCC)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-cast-function-type)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-deprecated-declarations)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-implicit-fallthrough)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-sign-compare)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-but-set-variable)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-const-variable)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-function)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-parameter)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-variable)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-maybe-uninitialized)
  add_cxx_flag_if_supported(CXX_CANCEL_STRICT_FLAGS -Wno-class-memaccess)
elseif(CMAKE_C_COMPILER_ID MATCHES "Clang")
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-pointer-bool-conversion)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-tautological-compare)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-sign-compare)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-const-variable)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-function)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-parameter)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-unused-variable)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-extra-semi-stmt)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-empty-init-stmt)
  add_c_flag_if_supported(CC_CANCEL_STRICT_FLAGS -Wno-maybe-uninitialized)
elseif(CMAKE_C_COMPILER_ID MATCHES "Intel")
elseif(CMAKE_C_COMPILER_ID MATCHES "MSVC")
endif()

################################################################################
# Platform specific configuration.

if(UNIX AND NOT APPLE)
  include(platform_unix)
elseif(WIN32)
  include(platform_win32)
elseif(APPLE)
  include(platform_apple)
endif()
