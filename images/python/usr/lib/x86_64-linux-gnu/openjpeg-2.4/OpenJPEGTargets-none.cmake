#----------------------------------------------------------------
# Generated CMake target import file for configuration "None".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "openjp2" for configuration "None"
set_property(TARGET openjp2 APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(openjp2 PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_NONE "m;-lpthread"
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjp2.so.2.4.0"
  IMPORTED_SONAME_NONE "libopenjp2.so.7"
  )

list(APPEND _IMPORT_CHECK_TARGETS openjp2 )
list(APPEND _IMPORT_CHECK_FILES_FOR_openjp2 "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjp2.so.2.4.0" )

# Import target "openjp2_static" for configuration "None"
set_property(TARGET openjp2_static APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(openjp2_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NONE "C"
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjp2.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS openjp2_static )
list(APPEND _IMPORT_CHECK_FILES_FOR_openjp2_static "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjp2.a" )

# Import target "openjpip" for configuration "None"
set_property(TARGET openjpip APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(openjpip PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_NONE "openjp2"
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjpip.so.2.4.0"
  IMPORTED_SONAME_NONE "libopenjpip.so.7"
  )

list(APPEND _IMPORT_CHECK_TARGETS openjpip )
list(APPEND _IMPORT_CHECK_FILES_FOR_openjpip "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjpip.so.2.4.0" )

# Import target "openjpip_server" for configuration "None"
set_property(TARGET openjpip_server APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(openjpip_server PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NONE "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_NONE "/usr/lib/x86_64-linux-gnu/libfcgi.so;/usr/lib/x86_64-linux-gnu/libcurl.so;-lpthread"
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjpip_server.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS openjpip_server )
list(APPEND _IMPORT_CHECK_FILES_FOR_openjpip_server "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libopenjpip_server.a" )

# Import target "opj_decompress" for configuration "None"
set_property(TARGET opj_decompress APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_decompress PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_decompress"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_decompress )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_decompress "${_IMPORT_PREFIX}/bin/opj_decompress" )

# Import target "opj_compress" for configuration "None"
set_property(TARGET opj_compress APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_compress PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_compress"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_compress )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_compress "${_IMPORT_PREFIX}/bin/opj_compress" )

# Import target "opj_dump" for configuration "None"
set_property(TARGET opj_dump APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_dump PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_dump"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_dump )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_dump "${_IMPORT_PREFIX}/bin/opj_dump" )

# Import target "opj_jpip_addxml" for configuration "None"
set_property(TARGET opj_jpip_addxml APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_jpip_addxml PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_jpip_addxml"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_jpip_addxml )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_jpip_addxml "${_IMPORT_PREFIX}/bin/opj_jpip_addxml" )

# Import target "opj_server" for configuration "None"
set_property(TARGET opj_server APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_server PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_server"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_server )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_server "${_IMPORT_PREFIX}/bin/opj_server" )

# Import target "opj_dec_server" for configuration "None"
set_property(TARGET opj_dec_server APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_dec_server PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_dec_server"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_dec_server )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_dec_server "${_IMPORT_PREFIX}/bin/opj_dec_server" )

# Import target "opj_jpip_transcode" for configuration "None"
set_property(TARGET opj_jpip_transcode APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_jpip_transcode PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_jpip_transcode"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_jpip_transcode )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_jpip_transcode "${_IMPORT_PREFIX}/bin/opj_jpip_transcode" )

# Import target "opj_jpip_test" for configuration "None"
set_property(TARGET opj_jpip_test APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(opj_jpip_test PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/bin/opj_jpip_test"
  )

list(APPEND _IMPORT_CHECK_TARGETS opj_jpip_test )
list(APPEND _IMPORT_CHECK_FILES_FOR_opj_jpip_test "${_IMPORT_PREFIX}/bin/opj_jpip_test" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
