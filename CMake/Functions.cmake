function(create_folder folderPath)
    get_filename_component(folderName ${folderPath} NAME)
add_custom_target(MAKE_${folderName} ALL
        COMMAND ${CMAKE_COMMAND} -E make_directory ${folderPath}
        BYPRODUCTS ${folderPath}
        OUTPUT ${folderPath})
endfunction()

function(conditionalAddSubdirectory directory condition)
    if(${condition} EQUAL 1)
        add_subdirectory(${directory})
    endif(${condition} EQUAL 1)
endfunction()

#Build individual codes
#Every individual library runs this function
function(add_code codeName)
    #Create static library for each code group
    add_library(${codeName} STATIC "${ARGN}")
    add_custom_target(MOVE_${codeName} ALL
            COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${codeName}> ${PROJECT_BINARY_DIR}/IncludedCodes
            DEPENDS ${codeName})
    set_target_properties(${codeName} PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/TempCodes)
    SET_TARGET_PROPERTIES(${codeName} PROPERTIES SUFFIX "")
    SET_TARGET_PROPERTIES(${codeName} PROPERTIES PREFIX "")

    add_dependencies(codeBarrier MOVE_${codeName})
endfunction()