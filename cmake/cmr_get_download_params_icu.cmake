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

# Part of "LibCMaker/cmake/modules/cmr_get_download_params.cmake".

  include(cmr_get_version_parts)
  cmr_get_version_parts(${version} major minor patch tweak)
  set(version_underscore "${major}_${minor}")

  if(version VERSION_EQUAL "58.2")
    # This is the last ICU4C release that works on Windows XP and Windows Vista.
    set(arch_file_sha
      "2b0a4410153a9b20de0e20c7d8b66049a72aef244b53683d0d7521371683da0c")
  endif()
  if(version VERSION_EQUAL "61.1")
    set(arch_file_sha
      "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef")
  endif()

  # http://download.icu-project.org/files/icu4c/61.1/icu4c-61_1-src.tgz
  set(base_url "http://download.icu-project.org/files/icu4c")
  set(src_dir_name    "icu4c-${version_underscore}-src")
  set(arch_file_name  "${src_dir_name}.tgz")
  set(unpack_to_dir   "${unpacked_dir}/icu-${version}")

  set(${out_ARCH_SRC_URL}
    "${base_url}/${version}/${arch_file_name}" PARENT_SCOPE
  )
  set(${out_ARCH_DST_FILE}  "${download_dir}/${arch_file_name}" PARENT_SCOPE)
  set(${out_ARCH_FILE_SHA}  "${arch_file_sha}" PARENT_SCOPE)
  set(${out_SHA_ALG}        "SHA256" PARENT_SCOPE)
  set(${out_UNPACK_TO_DIR}  "${unpack_to_dir}" PARENT_SCOPE)
  set(${out_UNPACKED_SOURCES_DIR} "${unpack_to_dir}/icu" PARENT_SCOPE)
  set(${out_VERSION_BUILD_DIR} "${build_dir}/icu-${version}" PARENT_SCOPE)
