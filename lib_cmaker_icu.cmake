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
set(lib_NAME "ICU")

# To find library's LibCMaker source dir.
set(lcm_${lib_NAME}_SRC_DIR ${CMAKE_CURRENT_LIST_DIR})

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
  # Building with host tools if need
  #-----------------------------------------------------------------------

  if(IOS OR ANDROID OR WINDOWS_STORE)
    set(ICU_CROSS_COMPILING ON)
    set(ICU_ENABLE_TOOLS OFF)
  endif()

  while(TRUE)
    if(host_BUILD_TOOLS)
      set(host_BUILD_TOOLS OFF)
    endif() 
    
    # Build tools for cross building if need
    if(ICU_CROSS_COMPILING OR IOS OR ANDROID OR WINDOWS_STORE)
      if(NOT ICU_CROSS_BUILDROOT)
        set(host_BUILD_TOOLS ON)
        
        set(host_UNPACKED_DIR ${arg_UNPACKED_DIR}/host_tools_sources)
        set(host_BUILD_DIR    ${arg_BUILD_DIR}_host_tools)
        cmr_print_var_value(host_UNPACKED_DIR)
        cmr_print_var_value(host_BUILD_DIR)

        # Store original values
        set(tmp_UNPACKED_DIR  ${arg_UNPACKED_DIR})
        set(tmp_BUILD_DIR     ${arg_BUILD_DIR})
        
        set(tmp_ICU_CROSS_COMPILING ${ICU_CROSS_COMPILING})
        set(tmp_ICU_ENABLE_EXTRAS   ${ICU_ENABLE_EXTRAS})
        set(tmp_ICU_ENABLE_TOOLS    ${ICU_ENABLE_TOOLS})
        set(tmp_ICU_DATA_PACKAGING  ${ICU_DATA_PACKAGING})
        set(tmp_ICU_ENABLE_TESTS    ${ICU_ENABLE_TESTS})
        set(tmp_ICU_ENABLE_SAMPLES  ${ICU_ENABLE_SAMPLES})
  
        # Set values for tools building
        set(arg_UNPACKED_DIR  ${host_UNPACKED_DIR})
        set(arg_BUILD_DIR     ${host_BUILD_DIR})
        
        set(ICU_CROSS_COMPILING OFF)
        set(ICU_ENABLE_EXTRAS   OFF)
        set(ICU_ENABLE_TOOLS    ON)
        set(ICU_DATA_PACKAGING  "auto")
        set(ICU_ENABLE_TESTS    OFF)
        set(ICU_ENABLE_SAMPLES  OFF)
      endif()
    endif()


    #-----------------------------------------------------------------------
    # Library specific build arguments.
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

    if(host_BUILD_TOOLS)
      cmr_print_message("-------- Build tools for cross building --------")

      cmr_lib_cmaker_main(
        NAME          ${lib_NAME}
        VERSION       ${arg_VERSION}
        BASE_DIR      ${lcm_${lib_NAME}_SRC_DIR}
        DOWNLOAD_DIR  ${arg_DOWNLOAD_DIR}
        UNPACKED_DIR  ${arg_UNPACKED_DIR}
        BUILD_DIR     ${arg_BUILD_DIR}
        CMAKE_ARGS    ${lcm_CMAKE_ARGS}
        BUILD
        BUILD_HOST_TOOLS
      )
    else()
      if(ICU_CROSS_BUILDROOT)
        cmr_print_message(
          "-------- Cross building with tools in ${ICU_CROSS_BUILDROOT} --------"
        )
      endif()

## +++ Common part of the lib_cmaker_<lib_name> function +++
      cmr_lib_cmaker_main(
        NAME          ${lib_NAME}
        VERSION       ${arg_VERSION}
        BASE_DIR      ${lcm_${lib_NAME}_SRC_DIR}
        DOWNLOAD_DIR  ${arg_DOWNLOAD_DIR}
        UNPACKED_DIR  ${arg_UNPACKED_DIR}
        BUILD_DIR     ${arg_BUILD_DIR}
        CMAKE_ARGS    ${lcm_CMAKE_ARGS}
        INSTALL
      )
## --- Common part of the lib_cmaker_<lib_name> function ---
    endif()
    

    # Restore settings after tools building if need
    if(host_BUILD_TOOLS)
      # Restore original values
      set(arg_UNPACKED_DIR  ${tmp_UNPACKED_DIR})
      set(arg_BUILD_DIR     ${tmp_BUILD_DIR})

      set(ICU_CROSS_COMPILING ${tmp_ICU_CROSS_COMPILING})
      set(ICU_ENABLE_EXTRAS   ${tmp_ICU_ENABLE_EXTRAS})
      set(ICU_ENABLE_TOOLS    ${tmp_ICU_ENABLE_TOOLS})
      set(ICU_DATA_PACKAGING  ${tmp_ICU_DATA_PACKAGING})
      set(ICU_ENABLE_TESTS    ${tmp_ICU_ENABLE_TESTS})
      set(ICU_ENABLE_SAMPLES  ${tmp_ICU_ENABLE_SAMPLES})

      # Cache var for use the host tools
      set(ICU_CROSS_BUILDROOT
        ${host_BUILD_DIR}/icu-${arg_VERSION}/source
        CACHE PATH
        "Specify an absolute path to the build directory of an ICU built for the current platform"
      )
    endif()

    if(NOT host_BUILD_TOOLS)
      break()
    endif()
  endwhile()
endfunction()
