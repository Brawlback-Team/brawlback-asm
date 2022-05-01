cmake_minimum_required(VERSION 3.15)

project(ProjectMCodes)

set(CMAKE_CXX_COMPILER ${PROJECT_SOURCE_DIR}\\BuildSystem\\Compiler\\bin\\powerpc-eabi-g++.exe)
set(CMAKE_LINKER ${PROJECT_SOURCE_DIR}\\BuildSystem\\Compiler\\bin\\powerpc-eabi-ld.exe)
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_LINKER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ppc)
set(CMAKE_CROSSCOMPILING 1)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    include(CMake/DebugSettings.cmake)
endif(CMAKE_BUILD_TYPE STREQUAL "Debug")
include(CMake/Paths.cmake)
include(CMake/Functions.cmake)


create_folder(${PROJECT_BINARY_DIR}/TempCodes)
add_custom_target(resetIncludedCodes ALL
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${PROJECT_BINARY_DIR}/IncludedCodes && ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/IncludedCodes
        BYPRODUCTS ${PROJECT_BINARY_DIR}/IncludedCodes/*
        OUTPUT ${PROJECT_BINARY_DIR}/IncludedCodes/*)


#Used to wait until everything is built
add_custom_target(codeBarrier DEPENDS resetIncludedCodes)

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


include_directories(${librariesDirectory})
include_directories(${globalsDirectory})


#code subdirectories
add_subdirectory(Codes)
add_subdirectory(Libraries)
add_subdirectory(Globals)

find_package(Python3 COMPONENTS Interpreter REQUIRED)
add_custom_target(build ALL
        COMMAND ${Python3_EXECUTABLE} ${builder} ${PROJECT_BINARY_DIR} ${PROJECT_BINARY_DIR}/IncludedCodes ${PPC_BIN_DIRECTORY} ${functionMapDirectory}
        DEPENDS codeBarrier)
