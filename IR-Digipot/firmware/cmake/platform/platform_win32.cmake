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

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin/Debug)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/Release)

if(MSVC)
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)

  # C4018 - 'expression' : signed/unsigned mismatch.
  # C4389 - 'operator' : signed/unsigned mismatch.
  #
  #         TODO(sergey): Ideally should be solved, but would need to ensure
  #         this warnming happens in all compiles. But also might be rather
  #         annoying in some places.
  #
  # C4127 - Conditional expression is constant.
  #
  #         Could be removed wqith C++17 and consexpr if().
  #
  # C4244 - Conversion from 'type1' to 'type2', possible loss of data.
  # C4245 - Conversion from 'type1' to 'type2', signed/unsigned mismatch.
  # C4267 - Conversion from 'size_t' to 'type', possible loss of data.
  #
  # C4310 - Cast truncates constant value.
  #
  # C4456 - declaration of 'identifier' hides previous local declaration
  # C4457 - declaration of 'identifier' hides function parameter
  # C4458 - Declaration of 'identifier' hides class member.
  #
  # C4996 - Your code uses a function, class member, variable,
  #         or typedef that's marked deprecated.
  #
  #         Happens for functions like fdopen().
  #         TODO(sergey); Such functions probably better be wrapped into some
  #         sort of higher level helper.
  string(CONCAT DEFAULT_DISABLE_WARNINGS
        "/wd4018 /wd4389 /wd4127 /wd4244 /wd4245 /wd4267 /wd4310 "
        "/wd4456 /wd4457 /wd4458 /wd4996")

  set(DEFAULT_C_FLAGS "/nologo /Gd /MP ${DEFAULT_DISABLE_WARNINGS}")
  set(DEFAULT_C_FLAGS_DEBUG "/MDd /ZI")
  set(DEFAULT_C_FLAGS_RELEASE "/MD")
  set(DEFAULT_C_FLAGS_MINSIZEREL "/MD")
  set(DEFAULT_C_FLAGS_RELWITHDEBINFO "/MD")

  set(DEFAULT_CXX_FLAGS "${DEFAULT_C_FLAGS} /EHsc")
  set(DEFAULT_CXX_FLAGS_DEBUG "${DEFAULT_C_FLAGS_DEBUG}")
  set(DEFAULT_CXX_FLAGS_RELEASE "${DEFAULT_C_FLAGS_RELEASE}")
  set(DEFAULT_CXX_FLAGS_MINSIZEREL "${DEFAULT_C_FLAGS_MINSIZEREL}")
  set(DEFAULT_CXX_FLAGS_RELWITHDEBINFO "${DEFAULT_C_FLAGS_RELWITHDEBINFO}")

  set(DEFAULT_STATIC_LINKER_FLAGS "/IGNORE:4221")

  # Remove all flags which are set explicitly here or which are being
  # overwritten by the ones from below.
  remove_cc_flags(
    "/MDd" "/MD" "/MP"
    "/Gr" "/Gd"
    "/Z7" "/Zi" "/ZI"
    "/EHsc")

  # Append own defaults to the CMake flags.

  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} ${DEFAULT_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${DEFAULT_CXX_FLAGS}")

  set(CMAKE_C_FLAGS_DEBUG
      "${CMAKE_C_FLAGS_DEBUG} ${DEFAULT_C_FLAGS_DEBUG}")
  set(CMAKE_CXX_FLAGS_DEBUG
      "${CMAKE_CXX_FLAGS_DEBUG} ${DEFAULT_CXX_FLAGS_DEBUG}")

  set(CMAKE_C_FLAGS_RELEASE
      "${CMAKE_C_FLAGS_RELEASE} ${DEFAULT_C_FLAGS_RELEASE}")
  set(CMAKE_CXX_FLAGS_RELEASE
      "${CMAKE_CXX_FLAGS_RELEASE} ${DEFAULT_CXX_FLAGS_RELEASE}")

  set(CMAKE_C_FLAGS_MINSIZEREL
     "${CMAKE_C_FLAGS_MINSIZEREL} ${DEFAULT_C_FLAGS_MINSIZEREL}")
  set(CMAKE_CXX_FLAGS_MINSIZEREL
      "${CMAKE_CXX_FLAGS_MINSIZEREL} ${DEFAULT_CXX_FLAGS_MINSIZEREL}")

  set(CMAKE_C_FLAGS_RELWITHDEBINFO
      "${CMAKE_C_FLAGS_RELWITHDEBINFO} ${DEFAULT_C_FLAGS_RELWITHDEBINFO}")
  set(CMAKE_CXX_FLAGS_RELWITHDEBINFO
      "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} ${DEFAULT_CXX_FLAGS_RELWITHDEBINFO}")

  set(CMAKE_STATIC_LINKER_FLAGS
      "${CMAKE_STATIC_LINKER_FLAGS} ${DEFAULT_STATIC_LINKER_FLAGS}")

  # Cleanup.
  unset(DEFAULT_C_FLAGS)
  unset(DEFAULT_C_FLAGS_DEBUG)
  unset(DEFAULT_C_FLAGS_RELEASE)
  unset(DEFAULT_C_FLAGS_MINSIZEREL)
  unset(DEFAULT_C_FLAGS_RELWITHDEBINFO)

  unset(DEFAULT_CXX_FLAGS)
  unset(DEFAULT_CXX_FLAGS_DEBUG)
  unset(DEFAULT_CXX_FLAGS_RELEASE)
  unset(DEFAULT_CXX_FLAGS_MINSIZEREL)
  unset(DEFAULT_CXX_FLAGS_RELWITHDEBINFO)
endif()
