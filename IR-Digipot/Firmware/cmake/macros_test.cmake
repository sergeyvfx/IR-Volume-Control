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

# Add new test target.
#
# Will use sourve file of ${FILENAME}_test.cc, compile it and link against
# ${EXTRA_LIBS} and add executable to ctests.
#
# By default tests will be grouped into IDE project folders based on their
# name prefix (for example, board_format_model will be added to Board folder
# inside of Unit Tests).
# It is possible to add extra subfolders in the hierarchyt by using FOLDER
# argument.
function(PS_TEST FILENAME)
  if(WITH_TESTS)
    cmake_parse_arguments(
      TEST
      ""
      "MODULE"
      "LIBRARIES;ARGUMENTS;FOLDER"
      ${ARGN}
    )
    get_filename_component(TEST_NAME "${FILENAME}" NAME)
    get_filename_component(TEST_DIRECTORY "${FILENAME}" DIRECTORY)
    set(_target_prefix "")
    if(NOT "${TEST_MODULE}" STREQUAL "")
      set(_target_prefix "${TEST_MODULE}_")
    endif()
    set(_target_name "${_target_prefix}${TEST_NAME}_test")
    set(_target_source "${TEST_NAME}_test.cc")
    if(NOT "${TEST_DIRECTORY}" STREQUAL "")
      set(_target_source "${TEST_DIRECTORY}/${_target_source}")
    endif()

    add_executable(
      "${_target_name}"
      "${_target_source}"
      ${EXTRA_SRC})
    target_link_libraries(
      "${_target_name}"
      ${TEST_LIBRARIES}  # Extra libs MUST be first.
      test_main
      ${GTEST_LIBRARIES}
      ${GLOG_LIBRARIES}
      ${GFLAGS_LIBRARIES}
      ${GMOCK_LIBRARIES}
      ${THREADS_LIBS})

    add_test(
      "${_target_name}"
      "${PS_TESTS_OUTPUT_DIR}/${_target_name}"
      ${TEST_ARGUMENTS}
    )
    # Add extra include directories to the target so it finds GLog ad GFlags.
    set(_extra_include_directories
      ${GLOG_INCLUDE_DIRS}
      ${GFLAGS_INCLUDE_DIRS}
      ${GTEST_INCLUDE_DIRS}
      ${GMOCK_INCLUDE_DIRS}
    )
    target_include_directories(
      ${_target_name}
      SYSTEM PRIVATE ${_extra_include_directories}
    )
    # Make sure test is created in it's own dedicated directory.
    PS_SET_TARGET_RUNTIME_DIRECTORY(
      "${_target_name}"
      "${PS_TESTS_OUTPUT_DIR}"
    )
    # Make it easy to run test projects from IDE.
    PS_SET_DEBUGGER_COMMAND_ARGUMENTS(${_target_name} "${TEST_ARGUMENTS}")
  endif()
endfunction()

# Add multiple tests which will share same module, link libraries and so on.
function(PS_TESTS)
  if(WITH_TESTS)
    cmake_parse_arguments(
      TEST
      ""
      "MODULE"
      "NAMES;LIBRARIES;ARGUMENTS;FOLDER"
      ${ARGN}
    )
    foreach(_test ${TEST_NAMES})
      PS_TEST("${_test}"
                MODULE "${TEST_MODULE}"
                LIBRARIES "${TEST_LIBRARIES}"
                ARGUMENTS "${TEST_ARGUMENTS}"
                FOLDER "${TEST_FOLDER}")
    endforeach()
  endif()
endfunction()
