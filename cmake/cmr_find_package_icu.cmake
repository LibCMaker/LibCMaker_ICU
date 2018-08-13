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

## +++ Common part of the lib_cmaker_<lib_name> function +++
set(cmr_lib_NAME "ICU")

# To find library's LibCMaker source dir.
set(lcm_${cmr_lib_NAME}_SRC_DIR ${CMAKE_CURRENT_LIST_DIR})

if(NOT LIBCMAKER_SRC_DIR)
  message(FATAL_ERROR
    "Please set LIBCMAKER_SRC_DIR with path to LibCMaker root.")
endif()

include(${LIBCMAKER_SRC_DIR}/cmake/modules/lib_cmaker_init.cmake)

function(lib_cmaker_icu)

  # Make the required checks.
  # Add library's and common LibCMaker module paths to CMAKE_MODULE_PATH.
  # Unset lcm_CMAKE_ARGS.
  # Set vars:
  #   cmr_CMAKE_MIN_VER
  #   cmr_lib_cmaker_main_PATH
  #   cmr_printers_PATH
  #   lower_lib_NAME
  # Parce args and set vars:
  #   arg_VERSION
  #   arg_DOWNLOAD_DIR
  #   arg_UNPACKED_DIR
  #   arg_BUILD_DIR
  lib_cmaker_init(${ARGN})

  include(${cmr_lib_cmaker_main_PATH})
  include(${cmr_printers_PATH})

  cmake_minimum_required(VERSION ${cmr_CMAKE_MIN_VER})
## --- Common part of the lib_cmaker_<lib_name> function ---


  #-----------------------------------------------------------------------
  # Library specific build arguments
  #-----------------------------------------------------------------------

## +++ Common part of the lib_cmaker_<lib_name> function +++
  set(cmr_LIB_VARS
    COPY_ICU_CMAKE_BUILD_SCRIPTS

    ICU_CROSS_COMPILING
    ICU_CROSS_BUILDROOT
    ICU_ENABLE_STRICT
    ICU_ENABLE_AUTO_CLEANUP
    ICU_ENABLE_DRAFT
    ICU_ENABLE_RENAMING
    ICU_ENABLE_TRACING
    ICU_ENABLE_PLUGINS
    ICU_DISABLE_DYLOAD
    ICU_ENABLE_RPATH
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

  foreach(d ${cmr_LIB_VARS})
    if(DEFINED ${d})
      list(APPEND lcm_CMAKE_ARGS
        -D${d}=${${d}}
      )
    endif()
  endforeach()
## --- Common part of the lib_cmaker_<lib_name> function ---


  #-----------------------------------------------------------------------
  # Building
  #-----------------------------------------------------------------------

  if(BUILD_HOST_TOOLS)
    cmr_print_status("======== Build tools for cross building ========")
    set(build_mode BUILD BUILD_HOST_TOOLS)
  else()
    if(ICU_CROSS_COMPILING)
      cmr_print_status(
        "======== Cross building with tools in ${ICU_CROSS_BUILDROOT} ========"
      )
    endif()
    set(build_mode INSTALL)
  endif()

  cmr_lib_cmaker_main(
    NAME          ${cmr_lib_NAME}
    VERSION       ${arg_VERSION}
    LANGUAGES     C CXX ASM
    BASE_DIR      ${lcm_${cmr_lib_NAME}_SRC_DIR}
    DOWNLOAD_DIR  ${arg_DOWNLOAD_DIR}
    UNPACKED_DIR  ${arg_UNPACKED_DIR}
    BUILD_DIR     ${arg_BUILD_DIR}
    CMAKE_ARGS    ${lcm_CMAKE_ARGS}
    ${build_mode}
  )

endfunction()
