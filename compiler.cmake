# Copyright (C) 2010 Florent Lamiraux, Thomas Moulard, JRL, CNRS/AIST.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

INCLUDE(CheckCXXCompilerFlag)

MACRO(_SETUP_PROJECT_WARNINGS)
  # -Wmissing-declarations is disabled for now
  # as older GCC version does not support it
  # but CMake doest not check for the flag acceptance
  # correctly.

  SET(FLAGS -Wall -Wcast-align -Wcast-qual
            -Wformat -Wwrite-strings -Wconversion)
  FOREACH(FLAG ${FLAGS})
    CHECK_CXX_COMPILER_FLAG(${FLAG} R${FLAG})
    IF(${R${FLAG}})
      SET(WARNING_CXX_FLAGS "${WARNING_CXX_FLAGS} ${FLAG}")
    ENDIF(${R${FLAG}})
  ENDFOREACH(FLAG ${FLAGS})

  IF(NOT DEFINED CXX_DISABLE_WERROR)
    SET(WARNING_CXX_FLAGS "-Werror ${WARNING_CXX_FLAGS}")
  ENDIF(NOT DEFINED CXX_DISABLE_WERROR)

  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${WARNING_CXX_FLAGS}")
ENDMACRO(_SETUP_PROJECT_WARNINGS)