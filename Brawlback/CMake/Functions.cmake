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