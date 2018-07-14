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

include(cmr_get_version_parts)
include(cmr_print_fatal_error)

function(cmr_icu_get_download_params
    version
    out_url out_sha out_src_dir_name out_tar_file_name)

  # http://download.icu-project.org/files/icu4c/61.1/icu4c-61_1-src.tgz
  set(lib_base_url "http://download.icu-project.org/files/icu4c")

  if(version VERSION_EQUAL "61.1")
    set(lib_sha
      "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef")
  endif()

  if(NOT DEFINED lib_sha)
    cmr_print_fatal_error("Library version ${version} is not supported.")
  endif()

  cmr_get_version_parts(${version} major minor patch tweak)
  set(version_underscore "${major}_${minor}")

  set(lib_src_name "icu4c-${version_underscore}-src")
  set(lib_tar_file_name "${lib_src_name}.tgz")
  set(lib_url "${lib_base_url}/${version}/${lib_tar_file_name}")

  set(${out_url} "${lib_url}" PARENT_SCOPE)
  set(${out_sha} "${lib_sha}" PARENT_SCOPE)
  set(${out_src_dir_name} "icu" PARENT_SCOPE)
  set(${out_tar_file_name} "${lib_tar_file_name}" PARENT_SCOPE)
endfunction()
