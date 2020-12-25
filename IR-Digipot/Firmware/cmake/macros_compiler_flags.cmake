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

# Remove all given compiler flags from all flavors of settings: including both
# C and C++ languages and all configurations.
macro(remove_cc_flags flags)
  foreach(flag ${ARGV})
    string(REGEX REPLACE ${flag} "" CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
    string(REGEX REPLACE ${flag} "" CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}")
    string(REGEX REPLACE ${flag} "" CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
    string(REGEX REPLACE ${flag} "" CMAKE_C_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL}")
    string(REGEX REPLACE ${flag} "" CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO}")

    string(REGEX REPLACE ${flag} "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    string(REGEX REPLACE ${flag} "" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
    string(REGEX REPLACE ${flag} "" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
    string(REGEX REPLACE ${flag} "" CMAKE_CXX_FLAGS_MINSIZEREL "${CMAKE_CXX_FLAGS_MINSIZEREL}")
    string(REGEX REPLACE ${flag} "" CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
  endforeach()
  unset(flag)
endmacro()

# Add single compiler flag to corresponding language.
macro(add_c_flag flag)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${flag}")
endmacro()
macro(add_cxx_flag flag)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
endmacro()

# Add single compiler flag to all languages.
macro(add_cc_flag flag)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${flag}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
endmacro()

# Remove all strict flags which are desired for own codebase but which generates
# a lot of warnings (possible treated as errors) in third party source code.
macro(remove_strict_flags)
  if(CMAKE_COMPILER_IS_GNUCC)
    remove_cc_flags(
      "-Wdouble-promotion"
      "-Wstrict-prototypes"
      "-Wmissing-prototypes"
      "-Wmissing-declarations"
      "-Wmissing-format-attribute"
      "-Wunused-local-typedefs"
      "-Wunused-macros"
      "-Wunused-parameter"
      "-Wunused-function"
      "-Wwrite-strings"
      "-Wredundant-decls"
      "-Wundef"
      "-Wshadow"
      "-Wdouble-promotion"
      "-Wold-style-definition"
      "-Wdeprecated"
      "-Werror=[^ ]+"
      "-Werror"
    )
    # Negate flags implied by '-Wall'.
    add_cc_flag("${CC_CANCEL_STRICT_FLAGS}")
    add_cxx_flag("${CXX_CANCEL_STRICT_FLAGS}")
  elseif(CMAKE_C_COMPILER_ID MATCHES "Clang")
    remove_cc_flags(
      "-Wmissing-prototypes"
      "-Wmissing-declarations"
      "-Wdouble-promotion"
      "-Wunused-parameter"
      "-Wunused-variable"
      "-Wimplicit-fallthrough"
      "-Wdeprecated"
      "-Werror=[^ ]+"
      "-Werror"
      "-Wundef"
    )
    # Negate flags implied by '-Wall'.
    add_cc_flag("${CC_CANCEL_STRICT_FLAGS}")
    add_cxx_flag("${CXX_CANCEL_STRICT_FLAGS}")
  elseif(MSVC)
    remove_cc_flags(
      # Remove both since it's unsafe to only remove /WX as it would leave
      # dangling "-" if there is "/WX-".
      # Rely on the default which does not treat warnings as errors.
      "/WX-"
      "/WX"

      "/W1"
      "/W2"
      "/W3"
      "/W4"
      "/Wall"
    )

    # Collect all flags in a single list.
    set(_extra_msvc_flags
      # Warning C4312: 'operation' : conversion from 'type1' to 'type2'
      #                of greater size.
      /wd4312
    )
    add_cc_flag("${_extra_msvc_flags}")
    unset(_extra_msvc_flags)
  endif()
endmacro()

function(add_c_flag_if_supported
    C_FLAGS_VAR
    FLAG_TO_ADD_IF_SUPPORTED)
  include(CheckCCompilerFlag)
  # Use of whitespace or '-' in variable names (used by CheckCSourceCompiles
  # as #defines) will trigger errors.
  string(STRIP "${FLAG_TO_ADD_IF_SUPPORTED}" FLAG_TO_ADD_IF_SUPPORTED)
  # Build an informatively named test result variable so that it will be evident
  # which tests were performed/succeeded in the CMake output, e.g for -Wall:
  #
  # -- Performing Test CHECK_C_FLAG_Wall - Success
  #
  # NOTE: This variable is also used to cache test result.
  string(REPLACE "-" "_" CHECK_C_FLAG "CHECK_C_FLAG${FLAG_TO_ADD_IF_SUPPORTED}")
  check_c_compiler_flag(${FLAG_TO_ADD_IF_SUPPORTED} ${CHECK_C_FLAG})
  if(${CHECK_C_FLAG})
    set(${C_FLAGS_VAR}
      "${${C_FLAGS_VAR}} ${FLAG_TO_ADD_IF_SUPPORTED}" PARENT_SCOPE)
  endif()
endfunction()

function(add_cxx_flag_if_supported
    CXX_FLAGS_VAR
    FLAG_TO_ADD_IF_SUPPORTED)
  include(CheckCXXCompilerFlag)
  # Use of whitespace or '-' in variable names (used by CheckCXXSourceCompiles
  # as #defines) will trigger errors.
  string(STRIP "${FLAG_TO_ADD_IF_SUPPORTED}" FLAG_TO_ADD_IF_SUPPORTED)
  # Build an informatively named test result variable so that it will be evident
  # which tests were performed/succeeded in the CMake output, e.g for -Wall:
  #
  # -- Performing Test CHECK_CXX_FLAG_Wall - Success
  #
  # NOTE: This variable is also used to cache test result.
  string(REPLACE "-" "_" CHECK_CXX_FLAG
    "CHECK_CXX_FLAG${FLAG_TO_ADD_IF_SUPPORTED}")
  check_cxx_compiler_flag(${FLAG_TO_ADD_IF_SUPPORTED} ${CHECK_CXX_FLAG})
  if(${CHECK_CXX_FLAG})
    set(${CXX_FLAGS_VAR}
      "${${CXX_FLAGS_VAR}} ${FLAG_TO_ADD_IF_SUPPORTED}" PARENT_SCOPE)
  endif()
endfunction()

# Backup of compiler flags is used to temporarily override these flags and then
# restore to theit previous state. This is used to discard strict compiler
# flags when dealing with find_package() with an external code, which might do
# try_compile() and geenrate warnings during test compile.
#
# NOTE: Nested backup is not supported.

macro(backup_compiler_flags)
  set(__CMAKE_C_FLAGS_BACKUP "${CMAKE_C_FLAGS}")
  set(__CMAKE_CXX_FLAGS_BACKUP "${CMAKE_CXX_FLAGS}")
endmacro()

macro(restore_compiler_flags)
  set(CMAKE_C_FLAGS "${__CMAKE_C_FLAGS_BACKUP}")
  set(CMAKE_CXX_FLAGS "${__CMAKE_CXX_FLAGS_BACKUP}")
  unset(__CMAKE_C_FLAGS_BACKUP)
  unset(__CMAKE_CXX_FLAGS_BACKUP)
endmacro()
