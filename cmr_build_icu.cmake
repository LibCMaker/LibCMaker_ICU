# ****************************************************************************
#  Project:  LibCMaker_ICU
#  Purpose:  A CMake build script for ICU library
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2019 NikitaFeodonit
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

#-----------------------------------------------------------------------
# The file is an example of the convenient script for the library build.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Lib's name, version, paths
#-----------------------------------------------------------------------

# TODO: use U_CHARSET_IS_UTF8=1, see http://userguide.icu-project.org/strings/utf-8

set(ICU_lib_NAME "ICU")
set(ICU_lib_VERSION "63.1" CACHE STRING "ICU_lib_VERSION")
set(ICU_lib_COMPONENTS i18n uc data CACHE STRING "ICU_lib_COMPONENTS")
set(ICU_lib_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE PATH "ICU_lib_DIR")

# To use our Find<LibName>.cmake.
list(APPEND CMAKE_MODULE_PATH "${ICU_lib_DIR}/cmake/modules")

if(BUILD_FOR_WINXP OR CMAKE_GENERATOR_TOOLSET STREQUAL "v141_xp")
  # This is the last ICU4C release that works on Windows XP and Windows Vista.
  set(ICU_lib_VERSION "58.2" CACHE STRING "ICU_lib_VERSION" FORCE)
endif()


#-----------------------------------------------------------------------
# LibCMaker_<LibName> specific vars and options
#-----------------------------------------------------------------------

option(COPY_ICU_CMAKE_BUILD_SCRIPTS "COPY_ICU_CMAKE_BUILD_SCRIPTS" ON)


#-----------------------------------------------------------------------
# Library specific vars and options
#-----------------------------------------------------------------------

option(ICU_CROSS_COMPILING "Enable cross compiling" OFF)
option(ICU_INSTALL_CROSS_CONFIG "Install cross config" OFF)
# Specify an absolute path to the build directory of an ICU built for the current platform
set(_ICU_CROSS_BUILDROOT "")
if(ICU_CROSS_COMPILING)
  if(NOT cmr_HOST_BUILD_DIR)
    cmr_print_error(
      "Please set cmr_HOST_BUILD_DIR with path to built host tools to cross compilation."
    )
  endif()
  # TODO:
#  set(_ICU_CROSS_BUILDROOT
#    "${cmr_HOST_BUILD_DIR}/build_${ICU_lib_NAME}/icu-${ICU_lib_VERSION}/source"
#  )
  set(_ICU_CROSS_BUILDROOT "${cmr_INSTALL_DIR}/host_tools")
endif()
set(
  ICU_CROSS_BUILDROOT ${_ICU_CROSS_BUILDROOT} CACHE PATH "ICU_CROSS_BUILDROOT"
)
# Compile with strict compiler options
option(ICU_ENABLE_STRICT "ICU_ENABLE_STRICT" ON)
# Compile with 'm' library.
option(ICU_USE_LIB_M "ICU_USE_LIB_M" OFF)
# Enable auto cleanup of libraries
option(ICU_ENABLE_AUTO_CLEANUP "ICU_ENABLE_AUTO_CLEANUP" OFF)
# Enable draft APIs (and internal APIs)
option(ICU_ENABLE_DRAFT "ICU_ENABLE_DRAFT" ON)
# Add a version suffix to symbols
option(ICU_ENABLE_RENAMING "ICU_ENABLE_RENAMING" ON)
# Enable function and data tracing
option(ICU_ENABLE_TRACING "ICU_ENABLE_TRACING" OFF)
# Enable plugins
option(ICU_ENABLE_PLUGINS "ICU_ENABLE_PLUGINS" OFF)
# Disable dynamic loading
option(ICU_DISABLE_DYLOAD "ICU_DISABLE_DYLOAD" ON)
# Use rpath when linking
option(ICU_ENABLE_RPATH "ICU_ENABLE_RPATH" OFF)
# Compile with 'wxs' or 'w' libraries.
option(ICU_USE_WCS_OR_W_LIB "ICU_USE_WCS_OR_W_LIB" OFF)
# Build ICU extras
option(ICU_ENABLE_EXTRAS "ICU_ENABLE_EXTRAS" OFF) # TODO: not released
# Build ICU's icuio library
option(ICU_ENABLE_ICUIO "ICU_ENABLE_ICUIO" ON)
# Build ICU's Paragraph Layout library. icu-le-hb must be available via find_package(icu-le-hb). See http://harfbuzz.org
option(ICU_ENABLE_LAYOUTEX "ICU_ENABLE_LAYOUTEX" OFF) # TODO: not released
# ...
#option(ICU_ENABLE_LAYOUT "ICU_ENABLE_LAYOUT" OFF)
# Build ICU's tools
set(_ICU_ENABLE_TOOLS ON)
if(ICU_CROSS_COMPILING)
  set(_ICU_ENABLE_TOOLS OFF)
endif()
option(ICU_ENABLE_TOOLS "ICU_ENABLE_TOOLS" ${_ICU_ENABLE_TOOLS})
# Specify how to package ICU data. Possible values: files, archive, library, static, auto. See http://userguide.icu-project.org/icudata for more info
set(ICU_DATA_PACKAGING "auto" CACHE STRING "ICU_DATA_PACKAGING") # TODO: 'files' mode is not released
# Tag a suffix to the library names
set(ICU_LIBRARY_SUFFIX "" CACHE STRING "ICU_LIBRARY_SUFFIX")
# Build ICU tests
option(ICU_ENABLE_TESTS "ICU_ENABLE_TESTS" OFF) # TODO: not released
# Build ICU samples
option(ICU_ENABLE_SAMPLES "ICU_ENABLE_SAMPLES" OFF) # TODO: not released


#-----------------------------------------------------------------------
# Build, install and find the library
#-----------------------------------------------------------------------

# TODO: build by COMPONENTS in find_package()

cmr_find_package(
  LibCMaker_DIR   ${LibCMaker_DIR}
  NAME            ${ICU_lib_NAME}
  VERSION         ${ICU_lib_VERSION}
  COMPONENTS      ${ICU_lib_COMPONENTS}
  LIB_DIR         ${ICU_lib_DIR}
  REQUIRED
)
