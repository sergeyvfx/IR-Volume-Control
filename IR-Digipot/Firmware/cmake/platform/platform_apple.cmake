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

set(CMAKE_MACOSX_RPATH ON)

# NOTE: There is a lot of manual logic is done here, especially to pick up
# proper SDK. This is needed in a specific case when compiler is provided
# explicitly via CMAKE_{C,CXX}_COMPILER. This might be useful to switch
# compilers around, possibly use sattic analyzer and things like this.

################################################################################
# Architecture.

if(NOT CMAKE_OSX_ARCHITECTURES)
  set(CMAKE_OSX_ARCHITECTURES x86_64 CACHE STRING
      "Choose the architecture you want to build Perseus for: i386, x86_64 or ppc"
      FORCE)
endif()

################################################################################
# macOS SDK version.

# Get macOS SDK version reported by Xcode.
# It will be used as a base to detect path to the actual SDK.
if(NOT DEFINED OSX_SDK_VERSION)
  execute_process(
    COMMAND xcodebuild -version -sdk macosx SDKVersion
    OUTPUT_VARIABLE OSX_SDK_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )
endif()

################################################################################
# Xcode information.

# Workaround for incorrect cmake xcode lookup for developer previews:
# XCODE_VERSION does not take xcode-select path into account but would always
# look into /Applications/Xcode.app while developer versions are named
# Xcode<version>-DP<preview_number>
execute_process(
  COMMAND xcode-select --print-path
  OUTPUT_VARIABLE XCODE_CHECK OUTPUT_STRIP_TRAILING_WHITESPACE
)
# Truncate to bundlepath in any case
string(REPLACE "/Contents/Developer" "" XCODE_BUNDLE ${XCODE_CHECK})

# When non-Xcode geenrator is used Cmake will not define XCODE_VERSION.
# This block of code takes care of detecting Xcode version in this case.
if(NOT ${CMAKE_GENERATOR} MATCHES "Xcode")
  # Unix makefile generator does not fill XCODE_VERSION var, so we get it with
  # a command.
  #
  # NOTE: The version consists of two lines of the following look:
  #   Xcode 11.4
  #   Build version 11E146
  # We only need the bare Xcode version.
  execute_process(
      COMMAND xcodebuild -version
      OUTPUT_VARIABLE XCODE_VERSION_FULL
      OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  # Replace newline as it makes regex to operate on per-line basis.
  string(REPLACE "\n" " " XCODE_VERSION_FULL "${XCODE_VERSION_FULL}")

  # Strip leading Xcode and all the trailing lines.
  string(
      REGEX REPLACE "Xcode ([0-9\\.]+).*" "\\1" XCODE_VERSION "${XCODE_VERSION_FULL}")
  if(NOT XCODE_VERSION)
    message(FATAL_ERROR "Xcode is required but not found.")
  endif()
endif()

if(IS_FIRST_RUN)
  message(STATUS "Detected Xcode ${XCODE_VERSION} at ${XCODE_BUNDLE}")
endif()

if(${XCODE_VERSION} VERSION_LESS 6.0)
  message(FATAL_ERROR "Xcode version 6.0 and above is required")
endif()

################################################################################
# Path to macOS SDK.

# Path prefix where to find development SDKs for the current platform.
set(OSX_SYSROOT_PLATFORM_PREFIX
    ${XCODE_BUNDLE}/Contents/Developer/Platforms/MacOSX.platform)
# Path prefix where to find actual SDKs.
set(OSX_SYSROOT_SDK_PREFIX ${OSX_SYSROOT_PLATFORM_PREFIX}/Developer/SDKs/)

set(SDKROOT_VERSION_SUFFIXES ${OSX_SDK_VERSION})
if(OSX_SDK_VERSION MATCHES "([0-9]+)\\.([0-9]+)\\.([0-9]+)")
  string(REGEX REPLACE "([0-9]+)\\.([0-9]+)\\.([0-9]+)" "\\1.\\2"
         OSX_SDK_VERSION_NO_PATCH "${OSX_SDK_VERSION}")
  list(APPEND SDKROOT_VERSION_SUFFIXES ${OSX_SDK_VERSION_NO_PATCH})
  unset(OSX_SDK_VERSION_NO_PATCH)
endif()

set(OSX_SDKROOT)
set(OSX_SDKROOT_FOUND FALSE)
foreach(SDKROOT_VERSION_SUFFIX ${SDKROOT_VERSION_SUFFIXES})
  if(EXISTS "${OSX_SYSROOT_SDK_PREFIX}/MacOSX${SDKROOT_VERSION_SUFFIX}.sdk")
    set(OSX_SDKROOT "MacOSX${SDKROOT_VERSION_SUFFIX}.sdk")
    set(OSX_SDKROOT_FOUND TRUE)
  endif()
endforeach()
unset(SDKROOT_VERSION_SUFFIXES)

if(NOT OSX_SDKROOT_FOUND)
  message(FATAL_ERROR "Unable to find SDK for macOS version ${OSX_SDK_VERSION}")
endif()

# Enforce CMake to use detected SDK.
set(CMAKE_OSX_SYSROOT
    ${OSX_SYSROOT_SDK_PREFIX}/${OSX_SDKROOT} CACHE PATH "" FORCE)

if(IS_FIRST_RUN)
  message(
      STATUS "Detected macOS SDK ${OSX_SDK_VERSION} at ${CMAKE_OSX_SYSROOT}")
endif()

# Make sure Xcode picks up the same SDK which has been detected above.
if(${CMAKE_GENERATOR} MATCHES "Xcode")
  set(CMAKE_XCODE_ATTRIBUTE_SDKROOT ${OSX_SDKROOT})
endif()

################################################################################
# Linker and compiler flags tweaks.

set(CMAKE_C_ARCHIVE_CREATE
    "<CMAKE_AR> Scr <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_CXX_ARCHIVE_CREATE
    "<CMAKE_AR> Scr <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_C_ARCHIVE_FINISH
    "<CMAKE_RANLIB> -no_warning_for_no_symbols -c <TARGET>")
set(CMAKE_CXX_ARCHIVE_FINISH
    "<CMAKE_RANLIB> -no_warning_for_no_symbols -c <TARGET>")
