cmake_minimum_required(VERSION 3.15)

message(STATUS "Using toolchain file: ${CMAKE_TOOLCHAIN_FILE}")

project(ProjectMCodes)

set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_LINKER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    include(CMake/DebugSettings.cmake)
endif(CMAKE_BUILD_TYPE STREQUAL "Debug")

include(CMake/Functions.cmake)

create_folder(${PROJECT_BINARY_DIR}/TempCodes)

add_custom_target(resetIncludedCodes ALL
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${PROJECT_BINARY_DIR}/IncludedCodes && ${CMAKE_COMMAND} -E make_directory ${PROJECT_BINARY_DIR}/IncludedCodes
        BYPRODUCTS ${PROJECT_BINARY_DIR}/IncludedCodes/*
        OUTPUT ${PROJECT_BINARY_DIR}/IncludedCodes/*)


#Used to wait until everything is built
add_custom_target(codeBarrier DEPENDS resetIncludedCodes)

include_directories(Libraries)
include_directories(Globals)

#code subdirectories
add_subdirectory(Codes)
add_subdirectory(Libraries)
add_subdirectory(Globals)

find_package(Python3 COMPONENTS Interpreter REQUIRED)

set(builder ${PROJECT_SOURCE_DIR}/BuildSystem/src/Build.py)
set(PPC_BIN_DIRECTORY "${buildSystemDirectory}/bin")
set(functionMapDirectory "${PROJECT_SOURCE_DIR}/BuildSystem/BrawlFuncMap.map")

add_custom_target(build ALL
        COMMAND ${Python3_EXECUTABLE} ${builder} ${PROJECT_BINARY_DIR} ${PROJECT_BINARY_DIR}/IncludedCodes ${PPC_BIN_DIRECTORY} ${functionMapDirectory}
        DEPENDS codeBarrier)