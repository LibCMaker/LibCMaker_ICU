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

cmake_minimum_required(VERSION 3.3)

project(LibCMaker_ICU_Build_Host_Tools_Test C CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(cmr_PRINT_DEBUG ON)


#-----------------------------------------------------------------------
# Configure to find_package()
#-----------------------------------------------------------------------

# Set CMake's search path for find_*() commands.
list(APPEND CMAKE_PREFIX_PATH "${CMAKE_INSTALL_PREFIX}")

if(ANDROID)
  list(APPEND CMAKE_FIND_ROOT_PATH "${CMAKE_INSTALL_PREFIX}")
endif()

# To use our FindICU.cmake.
list(APPEND CMAKE_MODULE_PATH
  "${PROJECT_SOURCE_DIR}/cmake/LibCMaker_ICU/cmake"
)


#-----------------------------------------------------------------------
# Set path to LibCMaker root
#-----------------------------------------------------------------------

set(LIBCMAKER_SRC_DIR "${PROJECT_SOURCE_DIR}/cmake/LibCMaker")
# Uncomment it if need functions from LibCMaker
#list(APPEND CMAKE_MODULE_PATH "${LIBCMAKER_SRC_DIR}/cmake/modules")


#-----------------------------------------------------------------------
# Set common vars to LibCMaker_ICU
#-----------------------------------------------------------------------

# Standard CMake vars.
#set(BUILD_SHARED_LIBS ON)

# Vars to lib_cmaker_icu().
set(ICU_lib_VERSION   "61.1")
set(ICU_DOWNLOAD_DIR  "${PROJECT_BINARY_DIR}")

set(COPY_ICU_CMAKE_BUILD_SCRIPTS ON)

# Library specific vars and options.

# Compile with strict compiler options
set(ICU_ENABLE_STRICT ON)
# Enable auto cleanup of libraries
set(ICU_ENABLE_AUTO_CLEANUP OFF)
# Enable draft APIs (and internal APIs)
set(ICU_ENABLE_DRAFT ON)
# Add a version suffix to symbols
set(ICU_ENABLE_RENAMING ON)
# Enable function and data tracing
set(ICU_ENABLE_TRACING OFF)
# Enable plugins
set(ICU_ENABLE_PLUGINS OFF)
# Disable dynamic loading
set(ICU_DISABLE_DYLOAD OFF)
# Use rpath when linking
set(ICU_ENABLE_RPATH OFF)

# Build ICU's icuio library
set(ICU_ENABLE_ICUIO ON)
# Build ICU's Paragraph Layout library. icu-le-hb must be available via find_package(icu-le-hb). See http://harfbuzz.org
set(ICU_ENABLE_LAYOUTEX OFF) # TODO: not released
# ...
#set(ICU_ENABLE_LAYOUT OFF)

# Specify how to package ICU data. Possible values: files, archive, library, static, auto. See http://userguide.icu-project.org/icudata for more info
set(ICU_DATA_PACKAGING "auto") # TODO: 'files' mode is not released
# Tag a suffix to the library names
set(ICU_LIBRARY_SUFFIX "")
# Build ICU tests
set(ICU_ENABLE_TESTS OFF) # TODO: not released
# Build ICU samples
set(ICU_ENABLE_SAMPLES OFF) # TODO: not released


#-----------------------------------------------------------------------
# Set vars to LibCMaker_ICU to build host tools
#-----------------------------------------------------------------------

# Standard CMake vars.
set(BUILD_SHARED_LIBS OFF)  # Always static for host tools.

# Vars to lib_cmaker_icu().
set(ICU_UNPACKED_DIR  "${PROJECT_BINARY_DIR}/host_tools_sources")
set(ICU_BUILD_DIR     "${PROJECT_BINARY_DIR}/build_icu_host_tools")

set(BUILD_HOST_TOOLS ON)

# Library specific vars and options.

# Enable cross compiling
set(ICU_CROSS_COMPILING OFF)
# Specify an absolute path to the build directory of an ICU built for the current platform
set(ICU_CROSS_BUILDROOT "")

# Build ICU extras
set(ICU_ENABLE_EXTRAS OFF) # TODO: not released

# Build ICU's tools
set(ICU_ENABLE_TOOLS ON)


#-----------------------------------------------------------------------
# Build the ICU tools
#-----------------------------------------------------------------------

include(${PROJECT_SOURCE_DIR}/cmake/LibCMaker_ICU/lib_cmaker_icu.cmake)

# Make compile and build the library's host tools at a config CMake phase.
lib_cmaker_icu(
  VERSION       ${ICU_lib_VERSION}
  DOWNLOAD_DIR  ${ICU_DOWNLOAD_DIR}
  UNPACKED_DIR  ${ICU_UNPACKED_DIR}
  BUILD_DIR     ${ICU_BUILD_DIR}
)


#-----------------------------------------------------------------------
# Check programs existing
#-----------------------------------------------------------------------

set(ICU_CROSS_BUILDROOT
  "${PROJECT_BINARY_DIR}/build_icu_host_tools/icu-61.1/source"
)

if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/derb)
  message(FATAL_ERROR "The program 'derb' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/escapesrc)
  message(FATAL_ERROR "The program 'escapesrc' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/genbrk)
  message(FATAL_ERROR "The program 'genbrk' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/genccode)
  message(FATAL_ERROR "The program 'genccode' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/gencfu)
  message(FATAL_ERROR "The program 'gencfu' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/gencmn)
  message(FATAL_ERROR "The program 'gencmn' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/gencnval)
  message(FATAL_ERROR "The program 'gencnval' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/gendict)
  message(FATAL_ERROR "The program 'gendict' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/gennorm2)
  message(FATAL_ERROR "The program 'gennorm2' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/genrb)
  message(FATAL_ERROR "The program 'genrb' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/gensprep)
  message(FATAL_ERROR "The program 'gensprep' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/gentest)
  message(FATAL_ERROR "The program 'gentest' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/icuinfo)
  message(FATAL_ERROR "The program 'icuinfo' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/icupkg)
  message(FATAL_ERROR "The program 'icupkg' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/makeconv)
  message(FATAL_ERROR "The program 'makeconv' is not found.")
endif()
if(NOT EXISTS ${ICU_CROSS_BUILDROOT}/bin/pkgdata)
  message(FATAL_ERROR "The program 'pkgdata' is not found.")
endif()


#-----------------------------------------------------------------------
# Stub target
#-----------------------------------------------------------------------


add_custom_target(build_host_tools ALL
  COMMAND ${CMAKE_COMMAND} -E echo
    "Host tools are ready in ${ICU_CROSS_BUILDROOT}."
)
