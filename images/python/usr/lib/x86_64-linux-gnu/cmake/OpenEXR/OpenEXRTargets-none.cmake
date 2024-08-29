#----------------------------------------------------------------
# Generated CMake target import file for configuration "None".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "OpenEXR::IlmImf" for configuration "None"
set_property(TARGET OpenEXR::IlmImf APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(OpenEXR::IlmImf PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libIlmImf-2_5.so.25.0.3"
  IMPORTED_SONAME_NONE "libIlmImf-2_5.so.25"
  )

list(APPEND _IMPORT_CHECK_TARGETS OpenEXR::IlmImf )
list(APPEND _IMPORT_CHECK_FILES_FOR_OpenEXR::IlmImf "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libIlmImf-2_5.so.25.0.3" )

# Import target "OpenEXR::IlmImfUtil" for configuration "None"
set_property(TARGET OpenEXR::IlmImfUtil APPEND PROPERTY IMPORTED_CONFIGURATIONS NONE)
set_target_properties(OpenEXR::IlmImfUtil PROPERTIES
  IMPORTED_LOCATION_NONE "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libIlmImfUtil-2_5.so.25.0.3"
  IMPORTED_SONAME_NONE "libIlmImfUtil-2_5.so.25"
  )

list(APPEND _IMPORT_CHECK_TARGETS OpenEXR::IlmImfUtil )
list(APPEND _IMPORT_CHECK_FILES_FOR_OpenEXR::IlmImfUtil "${_IMPORT_PREFIX}/lib/x86_64-linux-gnu/libIlmImfUtil-2_5.so.25.0.3" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
