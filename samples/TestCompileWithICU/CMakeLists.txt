# ****************************************************************************
#  Project:  LibCMaker_ICU
#  Purpose:  A CMake build script for ICU library
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2020 NikitaFeodonit
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

set(LibCMaker_LIB_DIR "${CMAKE_CURRENT_LIST_DIR}/libs")
set(LibCMaker_DIR "${LibCMaker_LIB_DIR}/LibCMaker")

include(${LibCMaker_DIR}/samples/cmr_get_cmake_min_ver.cmake NO_POLICY_SCOPE)
cmr_get_cmake_min_ver()
cmake_minimum_required(VERSION ${cmr_CMAKE_MIN_VER})

project(LibCMaker_ICU_Compile_Test C CXX)

include(${LibCMaker_DIR}/samples/cmr_samples_common_macros.cmake)


#-----------------------------------------------------------------------
# Common sample 1st part
#-----------------------------------------------------------------------

cmr_common_sample_1st_part()


#-----------------------------------------------------------------------
# Download, configure, build, install and find the required libraries
#-----------------------------------------------------------------------

include(${LibCMaker_LIB_DIR}/LibCMaker_ICU/cmr_build_icu.cmake)


#-----------------------------------------------------------------------
# Build the executable of the example
#-----------------------------------------------------------------------

# Get an example sources from the lib sources.
set(lib_EXAMPLES_SRC_DIR
  "${cmr_UNPACKED_DIR}/icu-${ICU_lib_VERSION}/icu/source/samples"
)

target_sources(${PROJECT_NAME}
  PRIVATE
    ${lib_EXAMPLES_SRC_DIR}/date/date.c
    ${lib_EXAMPLES_SRC_DIR}/date/uprint.c
    #${lib_EXAMPLES_SRC_DIR}/cal/cal.c
    #${lib_EXAMPLES_SRC_DIR}/cal/uprint.c
)
set_target_properties(${PROJECT_NAME} PROPERTIES
  CXX_STANDARD 11
  C_STANDARD 99
)


#-----------------------------------------------------------------------
# Link to the libraries
#-----------------------------------------------------------------------

#CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n
#LIBS = $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)

# ICU
if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(${PROJECT_NAME} PRIVATE U_STATIC_IMPLEMENTATION)
endif()
target_link_libraries(${PROJECT_NAME} PRIVATE ICU::i18n ICU::uc ICU::data)
# ICU is C++ library.
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)


#-----------------------------------------------------------------------
# Common sample 2nd part
#-----------------------------------------------------------------------

cmr_common_sample_2nd_part()


#-----------------------------------------------------------------------
# Testing
#-----------------------------------------------------------------------

set(test_src_DIR "${CMAKE_CURRENT_LIST_DIR}/src")
add_subdirectory(test)
