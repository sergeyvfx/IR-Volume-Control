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

include(macros_compiler_flags)
include(macros_test)

# Set binary executable output directory.
#
# Deals with MSVC's tendency to use separate folders for release and debug
# builds. Handy in this case to have single solution and be able to compile
# both release and debug builds without causing conflicts.
#
# TODO(sergey): Do we need to deal somehow with targets like RelWithDebInfo?
function(PS_SET_TARGET_RUNTIME_DIRECTORY TARGET_NAME OUTPUT_DIRECTORY)
  if(MSVC)
    set(_output_dir_release "${OUTPUT_DIRECTORY}/Release")
    set(_output_dir_debug "${OUTPUT_DIRECTORY}/Debug")
  else()
    set(_output_dir_release "${OUTPUT_DIRECTORY}")
    set(_output_dir_debug "${OUTPUT_DIRECTORY}")
  endif()
  set_target_properties(
    "${TARGET_NAME}" PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY         "${OUTPUT_DIRECTORY}"
    RUNTIME_OUTPUT_DIRECTORY_RELEASE "${_output_dir_release}"
    RUNTIME_OUTPUT_DIRECTORY_DEBUG   "${_output_dir_debug}"
  )
endfunction()

function(PS_SET_DEBUGGER_COMMAND_ARGUMENTS TARGET_NAME ARGUMENTS)
  # Convert arguments from list to a string of escaped arguments.
  set(escaped_arguments)
  foreach(argument ${ARGUMENTS})
    if(${argument} MATCHES "[ \t\r\n]")
      set(argument "\"${argument}\"")
    endif()
    list(APPEND escaped_arguments ${argument})
  endforeach()
  string(REPLACE ";" " " arguments_command_line "${escaped_arguments}")

  # Set the arguments to the target.
  if(MSVC)
    if(${CMAKE_VERSION} VERSION_GREATER "3.12")
      set_target_properties(${TARGET_NAME} PROPERTIES
           VS_DEBUGGER_COMMAND_ARGUMENTS "${arguments_command_line}")
    endif()
  endif()
endfunction()
