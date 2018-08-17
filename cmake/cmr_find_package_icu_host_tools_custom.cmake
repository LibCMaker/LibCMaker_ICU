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

    # Try to find already existed host tools.
    set(ICU_HOST_TOOLS_FOUND ON)
    set(tmp_ICU_CROSS_BUILDROOT "${lib_BUILD_DIR}/icu-${find_VERSION}/source")

    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/derb)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/escapesrc)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/genbrk)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/genccode)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gencfu)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gencmn)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gencnval)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gendict)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gennorm2)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/genrb)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gensprep)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gentest)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/icuinfo)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/icupkg)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/makeconv)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()
    if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/pkgdata)
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()

    if(NOT ICU_HOST_TOOLS_FOUND)
      cmr_print_status("${find_NAME} host tools is not built, build it.")

      include(cmr_find_package_${lib_NAME_LOWER})

      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/derb)
        message(FATAL_ERROR "The program 'derb' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/escapesrc)
        message(FATAL_ERROR "The program 'escapesrc' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/genbrk)
        message(FATAL_ERROR "The program 'genbrk' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/genccode)
        message(FATAL_ERROR "The program 'genccode' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gencfu)
        message(FATAL_ERROR "The program 'gencfu' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gencmn)
        message(FATAL_ERROR "The program 'gencmn' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gencnval)
        message(FATAL_ERROR "The program 'gencnval' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gendict)
        message(FATAL_ERROR "The program 'gendict' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gennorm2)
        message(FATAL_ERROR "The program 'gennorm2' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/genrb)
        message(FATAL_ERROR "The program 'genrb' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gensprep)
        message(FATAL_ERROR "The program 'gensprep' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/gentest)
        message(FATAL_ERROR "The program 'gentest' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/icuinfo)
        message(FATAL_ERROR "The program 'icuinfo' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/icupkg)
        message(FATAL_ERROR "The program 'icupkg' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/makeconv)
        message(FATAL_ERROR "The program 'makeconv' is not found.")
      endif()
      if(NOT EXISTS ${tmp_ICU_CROSS_BUILDROOT}/bin/pkgdata)
        message(FATAL_ERROR "The program 'pkgdata' is not found.")
      endif()

    else()
      cmr_print_status("${find_NAME} host tools is built, skip building it.")
    endif()

    set(ICU_CROSS_BUILDROOT ${tmp_ICU_CROSS_BUILDROOT} PARENT_SCOPE)
