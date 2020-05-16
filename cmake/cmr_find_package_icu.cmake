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

# Part of "LibCMaker/cmake/cmr_find_package.cmake".

  #-----------------------------------------------------------------------
  # Library specific build arguments
  #-----------------------------------------------------------------------

## +++ Common part of the lib_cmaker_<lib_name> function +++
  set(find_LIB_VARS
    COPY_ICU_CMAKE_BUILD_SCRIPTS

    ICU_CROSS_COMPILING
    ICU_CROSS_BUILDROOT
    ICU_ENABLE_STRICT
    ICU_USE_LIB_M
    ICU_ENABLE_AUTO_CLEANUP
    ICU_ENABLE_DRAFT
    ICU_ENABLE_RENAMING
    ICU_ENABLE_TRACING
    ICU_ENABLE_PLUGINS
    ICU_DISABLE_DYLOAD
    ICU_ENABLE_RPATH
    ICU_USE_WCS_OR_W_LIB
    ICU_ENABLE_EXTRAS
    ICU_ENABLE_ICUIO
    ICU_ENABLE_LAYOUTEX
    ICU_ENABLE_LAYOUT
    ICU_ENABLE_TOOLS
    ICU_DATA_PACKAGING
    ICU_LIBRARY_SUFFIX
    ICU_ENABLE_TESTS
    ICU_ENABLE_SAMPLES
  )

  foreach(d ${find_LIB_VARS})
    if(DEFINED ${d})
      list(APPEND find_CMAKE_ARGS
        -D${d}=${${d}}
      )
    endif()
  endforeach()
## --- Common part of the lib_cmaker_<lib_name> function ---


  #-----------------------------------------------------------------------
  # Building
  #-----------------------------------------------------------------------

  if(find_BUILD_HOST_TOOLS)
    cmr_print_status("======== Build tools for cross building ========")
    set(build_mode BUILD_HOST_TOOLS INSTALL)
  else()
    if(ICU_CROSS_COMPILING)
      cmr_print_status(
        "======== Cross building with tools in ${ICU_CROSS_BUILDROOT} ========"
      )
    endif()
    set(build_mode INSTALL)
  endif()

  cmr_lib_cmaker_main(
    LibCMaker_DIR ${find_LibCMaker_DIR}
    NAME          ${find_NAME}
    VERSION       ${find_VERSION}
    LANGUAGES     C CXX ASM
    BASE_DIR      ${find_LIB_DIR}
    DOWNLOAD_DIR  ${cmr_DOWNLOAD_DIR}
    UNPACKED_DIR  ${cmr_UNPACKED_DIR}
    BUILD_DIR     ${lib_BUILD_DIR}
    CMAKE_ARGS    ${find_CMAKE_ARGS}
    ${build_mode}
  )
