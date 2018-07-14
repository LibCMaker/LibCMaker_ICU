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

if(NOT LIBCMAKER_SRC_DIR)
  message(FATAL_ERROR
    "Please set LIBCMAKER_SRC_DIR with path to LibCMaker root")
endif()
# TODO: prevent multiply includes for CMAKE_MODULE_PATH
list(APPEND CMAKE_MODULE_PATH "${LIBCMAKER_SRC_DIR}/cmake/modules")


include(CMakeParseArguments) # cmake_parse_arguments

include(cmr_lib_cmaker)
include(cmr_print_debug_message)
include(cmr_print_message)
include(cmr_print_var_value)


# To find library CMaker source dir.
set(lcm_LibCMaker_ICU_SRC_DIR ${CMAKE_CURRENT_LIST_DIR})
# TODO: prevent multiply includes for CMAKE_MODULE_PATH
list(APPEND CMAKE_MODULE_PATH "${lcm_LibCMaker_ICU_SRC_DIR}/cmake/modules")

include(cmr_icu_get_download_params)


function(lib_cmaker_icu)
  cmake_minimum_required(VERSION 3.2)

  cmr_print_message("======== Build library: ICU ========")

  set(options
    # optional args
  )
  
  set(oneValueArgs
    # required args
    VERSION BUILD_DIR
    # optional args
    DOWNLOAD_DIR UNPACKED_SRC_DIR
  )

  set(multiValueArgs
    # optional args
  )

  cmake_parse_arguments(arg
      "${options}" "${oneValueArgs}" "${multiValueArgs}" "${ARGN}")
  # -> lib_VERSION
  # -> lib_BUILD_DIR
  # -> lib_* ...

  cmr_print_var_value(LIBCMAKER_SRC_DIR)

  cmr_print_var_value(arg_VERSION)
  cmr_print_var_value(arg_BUILD_DIR)

  cmr_print_var_value(arg_DOWNLOAD_DIR)
  cmr_print_var_value(arg_UNPACKED_SRC_DIR)

  # Required args
  if(NOT arg_VERSION)
    cmr_print_fatal_error("Argument VERSION is not defined.")
  endif()
  if(NOT arg_BUILD_DIR)
    cmr_print_fatal_error("Argument BUILD_DIR is not defined.")
  endif()
  if(arg_UNPARSED_ARGUMENTS)
    cmr_print_fatal_error(
      "There are unparsed arguments: ${arg_UNPARSED_ARGUMENTS}")
  endif()


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
        
        cmr_icu_get_download_params(${arg_VERSION}
          url sha src_dir_name arch_file_name
        )

        set(host_UNPACKED_SRC_DIR ${arg_UNPACKED_SRC_DIR}/host_tools_sources)
        set(host_BUILD_DIR ${arg_BUILD_DIR}_host_tools)
        cmr_print_var_value(host_UNPACKED_SRC_DIR)
        cmr_print_var_value(host_BUILD_DIR)

        # Store original values
        set(tmp_UNPACKED_SRC_DIR ${arg_UNPACKED_SRC_DIR})
        set(tmp_BUILD_DIR        ${arg_BUILD_DIR})
        
        set(tmp_ICU_CROSS_COMPILING ${ICU_CROSS_COMPILING})
        set(tmp_ICU_ENABLE_EXTRAS   ${ICU_ENABLE_EXTRAS})
        set(tmp_ICU_ENABLE_TOOLS    ${ICU_ENABLE_TOOLS})
        set(tmp_ICU_DATA_PACKAGING  ${ICU_DATA_PACKAGING})
        set(tmp_ICU_ENABLE_TESTS    ${ICU_ENABLE_TESTS})
        set(tmp_ICU_ENABLE_SAMPLES  ${ICU_ENABLE_SAMPLES})
  
        # Set values for tools building
        set(arg_UNPACKED_SRC_DIR ${host_UNPACKED_SRC_DIR})
        set(arg_BUILD_DIR        ${host_BUILD_DIR})
        
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
  
    set(lcm_CMAKE_ARGS)
  
    set(LIB_VARS
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
  
    foreach(d ${LIB_VARS})
      if(DEFINED ${d})
        list(APPEND lcm_CMAKE_ARGS
          -D${d}=${${d}}
        )
      endif()
    endforeach()
  
    
    #-----------------------------------------------------------------------
    # BUILDING
    #-----------------------------------------------------------------------
  
    if(host_BUILD_TOOLS)
      cmr_print_message("-------- Build tools for cross building --------")

      cmr_lib_cmaker(
        VERSION           ${arg_VERSION}
        PROJECT_DIR       ${lcm_LibCMaker_ICU_SRC_DIR}
        DOWNLOAD_DIR      ${arg_DOWNLOAD_DIR}
        UNPACKED_SRC_DIR  ${arg_UNPACKED_SRC_DIR}
        BUILD_DIR         ${arg_BUILD_DIR}
        CMAKE_ARGS        ${lcm_CMAKE_ARGS}
        BUILD
        BUILD_HOST_TOOLS
      )
    else()
      if(ICU_CROSS_BUILDROOT)
        cmr_print_message(
          "-------- Cross building with tools in ${ICU_CROSS_BUILDROOT} --------"
        )
      endif()

      cmr_lib_cmaker(
        VERSION           ${arg_VERSION}
        PROJECT_DIR       ${lcm_LibCMaker_ICU_SRC_DIR}
        DOWNLOAD_DIR      ${arg_DOWNLOAD_DIR}
        UNPACKED_SRC_DIR  ${arg_UNPACKED_SRC_DIR}
        BUILD_DIR         ${arg_BUILD_DIR}
        CMAKE_ARGS        ${lcm_CMAKE_ARGS}
        INSTALL
      )
    endif()
    


    # Restore settings after tools building if need
    if(host_BUILD_TOOLS)
      # Restore original values
      set(arg_UNPACKED_SRC_DIR ${tmp_UNPACKED_SRC_DIR})
      set(arg_BUILD_DIR        ${tmp_BUILD_DIR})

      set(ICU_CROSS_COMPILING ${tmp_ICU_CROSS_COMPILING})
      set(ICU_ENABLE_EXTRAS   ${tmp_ICU_ENABLE_EXTRAS})
      set(ICU_ENABLE_TOOLS    ${tmp_ICU_ENABLE_TOOLS})
      set(ICU_DATA_PACKAGING  ${tmp_ICU_DATA_PACKAGING})
      set(ICU_ENABLE_TESTS    ${tmp_ICU_ENABLE_TESTS})
      set(ICU_ENABLE_SAMPLES  ${tmp_ICU_ENABLE_SAMPLES})

      # Cache var for use the host tools
      set(ICU_CROSS_BUILDROOT
        ${host_BUILD_DIR}/${src_dir_name}-${arg_VERSION}/source
        CACHE PATH
        "Specify an absolute path to the build directory of an ICU built for the current platform"
      )
    endif()

    if(NOT host_BUILD_TOOLS)
      break()
    endif()
  endwhile()
endfunction()
