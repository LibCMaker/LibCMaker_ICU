# ****************************************************************************
#  Project:  LibCMaker_ICU
#  Purpose:  A CMake build script for ICU library
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2018 NikitaFeodonit
#
#    This file is part of the LibCMaker_ICU project.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
# ****************************************************************************

# Part of "LibCMaker/cmake/cmr_build_rules.cmake".

  # Copy CMake build scripts.
  if(COPY_ICU_CMAKE_BUILD_SCRIPTS)
    cmr_print_status("Copy CMake build scripts to unpacked sources.")
    execute_process(
      COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${lib_BASE_DIR}/patch/icu
        ${lib_UNPACK_TO_DIR}/icu/
    )
    if(MSVC OR MINGW)
      cmr_print_status("Copy patches to unpacked sources.")
      execute_process(
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
          ${lib_BASE_DIR}/patch/patches/icu-${lib_VERSION}/icu/source/tools/pkgdata/pkgdata.cpp
          ${lib_UNPACK_TO_DIR}/icu/source/tools/pkgdata/pkgdata.cpp
      )
    endif()
  endif()

  # Configure library.
  add_subdirectory(${lib_SRC_DIR} ${lib_VERSION_BUILD_DIR})
