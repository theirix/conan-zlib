if(ZLIB_FOUND)
    return()
endif()

find_path(ZLIB_INCLUDE_DIR NAMES zlib.h PATHS ${CONAN_INCLUDE_DIRS_ZLIB})

foreach(conan_lib_zlib ${CONAN_LIBS_ZLIB})
  find_library(ZLIB_LIB_${conan_lib_zlib} NAMES ${conan_lib_zlib} PATHS ${CONAN_LIB_DIRS_ZLIB})
  list(APPEND ZLIB_LIBRARIES ${ZLIB_LIB_${conan_lib_zlib}})
endforeach()

set(ZLIB_FOUND TRUE)
set(ZLIB_INCLUDE_DIRS ${ZLIB_INCLUDE_DIR})
mark_as_advanced(ZLIB_LIBRARIES ZLIB_LIBRARY ZLIB_INCLUDE_DIR)

if (NOT TARGET ZLIB::ZLIB)
    add_library(ZLIB::ZLIB INTERFACE IMPORTED)
    set_target_properties(ZLIB::ZLIB PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${ZLIB_INCLUDE_DIR}"
        INTERFACE_LINK_LIBRARIES "${ZLIB_LIBRARIES}"
    )
endif()
