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
# Policies

cmake_minimum_required(VERSION 3.5)

################################################################################
# Macros and utilities.

list(APPEND CMAKE_MODULE_PATH
  "${CMAKE_SOURCE_DIR}/cmake"
  "${CMAKE_SOURCE_DIR}/cmake/Modules"
  "${CMAKE_SOURCE_DIR}/cmake/platform"
)

include(CMakeParseArguments)
include(CheckIncludeFiles)
include(CheckCXXCompilerFlag)

include(macros)

################################################################################
# Project initialization.

# NOTE: Keep prior to project(), as per CMake documentation.
if(NOT CMAKE_OSX_DEPLOYMENT_TARGET)
  # 10.9 is our min. target, if you use higher SDK, weak linking happens.
  set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9" CACHE STRING "" FORCE)
endif()

project(Perseus)

################################################################################
# Options.

# Default to the release build type.
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to Release as none was specified.")
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
               "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

# General options
option(WITH_TESTS "Build the unit tests" ON)

# Allow linking against system libraries instead of the bundled ones.
option(WITH_SYSTEM_GFLAGS   "Use system-wide Gflags instead of a bundled one" OFF)
option(WITH_SYSTEM_GLOG     "Use system-wide Glog instead of a bundled one" OFF)
option(WITH_SYSTEM_GTEST    "Use system-wide Gtest instead of a bundled one" OFF)
option(WITH_SYSTEM_GMOCK    "Use system-wide Gmock instead of a bundled one" OFF)

###############################################################################
# Global configuration.

enable_testing()

set(EXECUTABLE_OUTPUT_DIR ${CMAKE_BINARY_DIR}/bin CACHE INTERNAL "" FORCE)
set(LIBRARY_OUTPUT_DIR ${CMAKE_BINARY_DIR}/lib CACHE INTERNAL "" FORCE)
set(PS_TESTS_OUTPUT_DIR ${EXECUTABLE_OUTPUT_DIR}/tests CACHE INTERNAL "" FORCE)

include(configure_build)
include(external_libs)

################################################################################
# Sources.

add_subdirectory(external)
add_subdirectory(source)
