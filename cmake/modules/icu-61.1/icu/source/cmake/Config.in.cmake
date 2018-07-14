@PACKAGE_INIT@

# Find the required libraries

if(@HAVE_THREADS@)
  find_package(Threads REQUIRED)
endif()

if(@HAVE_LIB_M@)
  find_library(LIB_M_LOCATION NAMES m)
  if(NOT LIB_M_LOCATION)
    message(STATUS "'m' library is not found.")
  endif()
#  set(LIB_M_TARGET @LIB_M_TARGET@)
#  add_library(${LIB_M_TARGET} SHARED IMPORTED)
#  set_target_properties(${LIB_M_TARGET} PROPERTIES
#    IMPORTED_LOCATION "${LIB_M_LOCATION}"
#  )
endif()

if(@HAVE_LIB_DL@)
  find_library(LIB_DL_LOCATION NAMES ${CMAKE_DL_LIBS})
  if(NOT LIB_DL_LOCATION)
    message(STATUS "'${CMAKE_DL_LIBS}' library is not found.")
  endif()
#  set(LIB_DL_TARGET @LIB_DL_TARGET@)
#  add_library(${LIB_DL_TARGET} SHARED IMPORTED)
#  set_target_properties(${LIB_DL_TARGET} PROPERTIES
#    IMPORTED_LOCATION "${LIB_DL_LOCATION}"
#  )
endif()

include("${CMAKE_CURRENT_LIST_DIR}/@TARGETS_EXPORT_NAME@.cmake")
check_required_components("@PROJECT_NAME@")

function(__icu_set_pkgdata_path)
  if(EXISTS "${ICU_PKGDATA_EXECUTABLE}")
    return()
  endif()

  if(NOT TARGET @PROJECT_NAME@::pkgdata)
    message(FATAL_ERROR "Internal error")
  endif()

  get_target_property(configurations @PROJECT_NAME@::pkgdata IMPORTED_CONFIGURATIONS)
  if(NOT configurations)
    message(FATAL_ERROR "Internal error")
  endif()
  list(LENGTH configurations len)
  if(len EQUAL "0")
    message(FATAL_ERROR "Internal error")
  endif()

  list(FIND configurations "RELEASE" release_index)
  if(release_index EQUAL "-1")
    list(GET configurations 0 use_config)
  else()
    set(use_config RELEASE)
  endif()

  get_target_property(
      ICU_PKGDATA_EXECUTABLE @PROJECT_NAME@::pkgdata IMPORTED_LOCATION_${use_config}
  )

  if(NOT EXISTS "${ICU_PKGDATA_EXECUTABLE}")
    message(FATAL_ERROR "Internal error")
  endif()

  set(ICU_PKGDATA_EXECUTABLE "${ICU_PKGDATA_EXECUTABLE}" PARENT_SCOPE)
endfunction()

function(__icu_set_icupkg_path)
  if(EXISTS "${ICU_ICUPKG_EXECUTABLE}")
    return()
  endif()

  if(NOT TARGET @PROJECT_NAME@::icupkg)
    message(FATAL_ERROR "Internal error")
  endif()

  get_target_property(configurations @PROJECT_NAME@::icupkg IMPORTED_CONFIGURATIONS)
  if(NOT configurations)
    message(FATAL_ERROR "Internal error")
  endif()
  list(LENGTH configurations len)
  if(len EQUAL "0")
    message(FATAL_ERROR "Internal error")
  endif()

  list(FIND configurations "RELEASE" release_index)
  if(release_index EQUAL "-1")
    list(GET configurations 0 use_config)
  else()
    set(use_config RELEASE)
  endif()

  get_target_property(
      ICU_ICUPKG_EXECUTABLE @PROJECT_NAME@::icupkg IMPORTED_LOCATION_${use_config}
  )

  if(NOT EXISTS "${ICU_ICUPKG_EXECUTABLE}")
    message(FATAL_ERROR "Internal error")
  endif()

  set(ICU_ICUPKG_EXECUTABLE "${ICU_ICUPKG_EXECUTABLE}" PARENT_SCOPE)
endfunction()

if(@ICU_ENABLE_TOOLS@)
  __icu_set_pkgdata_path()
  __icu_set_icupkg_path()
endif()

if(@PKGDATA_MODE@ STREQUAL "common")
  get_filename_component(
      ICU_DATA_FILE
      "@ICUPKGDATA_DIR@/@ICUDATA_SOURCE_ARCHIVE_FILE_NAME@"
      ABSOLUTE
  )

  if(NOT EXISTS ${ICU_DATA_FILE})
    message(FATAL_ERROR "File not exists: ${ICU_DATA_FILE}")
  endif()

  if(IS_DIRECTORY ${ICU_DATA_FILE})
    message(FATAL_ERROR "Is directory: ${ICU_DATA_FILE}")
  endif()
endif()
