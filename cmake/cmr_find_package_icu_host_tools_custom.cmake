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
    #set(tmp_ICU_CROSS_BUILDROOT "${lib_BUILD_DIR}/icu-${find_VERSION}/source")
    set(tmp_ICU_CROSS_BUILDROOT "${cmr_INSTALL_DIR}")
    set(icu_cross_config "${tmp_ICU_CROSS_BUILDROOT}/config/icucross.cmake")

    set(tool_list
      derb
      escapesrc
      genbrk
      genccode
      gencfu
      gencmn
      gencnval
      gendict
      gennorm2
      genrb
      gensprep
      gentest
      icuinfo
      icupkg
      makeconv
      pkgdata
    )


    if(EXISTS ${icu_cross_config})
      include(${icu_cross_config})
      set(icu_cross_bin_DIR "${tmp_ICU_CROSS_BUILDROOT}${TOOLBINDIR}")
      set(icu_cross_lib_DIR "${tmp_ICU_CROSS_BUILDROOT}${TOOLLIBDIR}")

      macro(find_icu_tool name)
        if(NOT EXISTS "${icu_cross_bin_DIR}/${name}")
          set(ICU_HOST_TOOLS_FOUND OFF)
        endif()
      endmacro()

      foreach(tool IN LISTS tool_list)
        find_icu_tool(${tool})
        if(NOT ICU_HOST_TOOLS_FOUND)
          break()
        endif()
      endforeach()
    else()
      set(ICU_HOST_TOOLS_FOUND OFF)
    endif()


    if(NOT ICU_HOST_TOOLS_FOUND)
      cmr_print_status("${find_NAME} host tools is not built, build it.")

      include(cmr_find_package_${lib_NAME_LOWER})

      if(NOT EXISTS ${icu_cross_config})
        message(FATAL_ERROR "The file 'config/icucross.cmake' is not exist.")
      endif()
      include(${icu_cross_config})
      set(icu_cross_bin_DIR "${tmp_ICU_CROSS_BUILDROOT}${TOOLBINDIR}")
      set(icu_cross_lib_DIR "${tmp_ICU_CROSS_BUILDROOT}${TOOLLIBDIR}")

      macro(check_icu_tool name)
        if(NOT EXISTS "${icu_cross_bin_DIR}/${name}")
          message(FATAL_ERROR "The program '${name}' is not found.")
        endif()
      endmacro()

      foreach(tool IN LISTS tool_list)
        check_icu_tool(${tool})
      endforeach()
    else()
      cmr_print_status("${find_NAME} host tools is built, skip building it.")
    endif()


    set(ICU_CROSS_BUILDROOT ${tmp_ICU_CROSS_BUILDROOT} PARENT_SCOPE)
