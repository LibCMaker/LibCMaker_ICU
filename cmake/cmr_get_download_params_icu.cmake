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

# Part of "LibCMaker/cmake/cmr_get_download_params.cmake".

  include(cmr_get_version_parts)
  cmr_get_version_parts(${version} ver_major ver_minor ver_patch ver_tweak)

  if(version VERSION_EQUAL "58.2")
    # This is the last ICU4C release that works on Windows XP and Windows Vista.
    set(arch_file_sha
      "2b0a4410153a9b20de0e20c7d8b66049a72aef244b53683d0d7521371683da0c")
  endif()
  if(version VERSION_EQUAL "61.1")
    set(arch_file_sha
      "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef")
  endif()
  if(version VERSION_EQUAL "62.1")
    set(arch_file_sha
      "3dd9868d666350dda66a6e305eecde9d479fb70b30d5b55d78a1deffb97d5aa3")
  endif()
  if(version VERSION_EQUAL "63.1")
    set(arch_file_sha
      "05c490b69454fce5860b7e8e2821231674af0a11d7ef2febea9a32512998cb9d")
  endif()

  # -old- http://download.icu-project.org/files/icu4c/61.1/icu4c-61_1-src.tgz
  # https://github.com/unicode-org/icu/releases/download/release-63-1/icu4c-63_1-src.tgz
  set(base_url "https://github.com/unicode-org/icu/releases/download")
  set(src_dir_name    "icu4c-${ver_major}_${ver_minor}-src")
  set(arch_file_name  "${src_dir_name}.tgz")
  set(unpack_to_dir   "${unpacked_dir}/icu-${version}")

  set(${out_ARCH_SRC_URL}
    "${base_url}/release-${ver_major}-${ver_minor}/${arch_file_name}" PARENT_SCOPE
  )
  set(${out_ARCH_DST_FILE}  "${download_dir}/${arch_file_name}" PARENT_SCOPE)
  set(${out_ARCH_FILE_SHA}  "${arch_file_sha}" PARENT_SCOPE)
  set(${out_SHA_ALG}        "SHA256" PARENT_SCOPE)
  set(${out_UNPACK_TO_DIR}  "${unpack_to_dir}" PARENT_SCOPE)
  set(${out_UNPACKED_SOURCES_DIR} "${unpack_to_dir}/icu" PARENT_SCOPE)
  set(${out_VERSION_BUILD_DIR} "${build_dir}/icu-${version}" PARENT_SCOPE)
