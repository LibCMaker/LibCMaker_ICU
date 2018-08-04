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

project(LibCMaker_ICU_Cross_Compile_Test C CXX)

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
# Set vars to LibCMaker_ICU to cross build
#-----------------------------------------------------------------------

# Standard CMake vars.

# Vars to lib_cmaker_icu().
set(ICU_UNPACKED_DIR  "${PROJECT_BINARY_DIR}")
set(ICU_BUILD_DIR     "${PROJECT_BINARY_DIR}/build_icu")

# Library specific vars and options.

# Enable cross compiling
set(ICU_CROSS_COMPILING ON)
# Specify an absolute path to the build directory of an ICU built for the current platform
set(ICU_CROSS_BUILDROOT
  "${PROJECT_BINARY_DIR}/@_host_tools/build_icu_host_tools/icu-61.1/source"
)

# Build ICU extras
set(ICU_ENABLE_EXTRAS OFF) # TODO: not released

# Build ICU's tools
set(ICU_ENABLE_TOOLS OFF)


#-----------------------------------------------------------------------
# Cross build and install the ICU
#-----------------------------------------------------------------------

include(${PROJECT_SOURCE_DIR}/cmake/LibCMaker_ICU/lib_cmaker_icu.cmake)

# Make cross compile, build and install the library at a config CMake phase.
lib_cmaker_icu(
  VERSION       ${ICU_lib_VERSION}
  DOWNLOAD_DIR  ${ICU_DOWNLOAD_DIR}
  UNPACKED_DIR  ${ICU_UNPACKED_DIR}
  BUILD_DIR     ${ICU_BUILD_DIR}
)


#-----------------------------------------------------------------------
# find_package()
#-----------------------------------------------------------------------

# TODO: build by COMPONENTS in find_package()

# Use newly got library.
#find_package(ICU 61.1 REQUIRED COMPONENTS ddd CONFIG) # TODO:
find_package(ICU 61.1 REQUIRED CONFIG)


#-----------------------------------------------------------------------
# Link to the library
#-----------------------------------------------------------------------

# Build test executables.

# To run it on Linux with the shared ICU libs
# which are built with non standard path in CMAKE_INSTALL_PREFIX use:
# LD_LIBRARY_PATH="<${CMAKE_INSTALL_PREFIX}>/lib:.:$LD_LIBRARY_PATH" ./LibCMaker_ICU_Compile_Test
# where <${CMAKE_INSTALL_PREFIX}> is path which is used as value for CMAKE_INSTALL_PREFIX.

# Get an example sources from the lib sources.
set(lib_EXAMPLES_SRC_DIR
  "${ICU_UNPACKED_DIR}/icu-${ICU_lib_VERSION}/icu/source/samples"
)

add_executable(${PROJECT_NAME}
  ${lib_EXAMPLES_SRC_DIR}/date/date.c
  ${lib_EXAMPLES_SRC_DIR}/date/uprint.c
#  ${lib_EXAMPLES_SRC_DIR}/cal/cal.c
#  ${lib_EXAMPLES_SRC_DIR}/cal/uprint.c
)
set_target_properties(${PROJECT_NAME} PROPERTIES
  C_STANDARD 99
  CXX_STANDARD 11
)

#CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n
#LIBS = $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)

# ICU
#target_include_directories(${PROJECT_NAME} PRIVATE ${ICU_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ICU::i18n ICU::uc ICU::data)

# ICU is C++ library.
#set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
