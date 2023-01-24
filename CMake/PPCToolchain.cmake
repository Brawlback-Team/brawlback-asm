set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ppc)
set(CMAKE_CROSSCOMPILING 1)

#TODO: rename buildSystem directory, sounds too much like SRC_DIR/BuildSystem, which it is not
# equal to on Linux
if(WIN32)
  set(DEVKIT_DIR ${CMAKE_CURRENT_LIST_DIR}/../BuildSystem/Compiler)
  set(CMAKE_CXX_COMPILER ${DEVKIT_DIR}/bin/powerpc-eabi-g++.exe)
else()
  set(DEVKIT_DIR $ENV{DEVKITPPC})
  set(CMAKE_CXX_COMPILER ${DEVKIT_DIR}/bin/powerpc-eabi-g++)
endif()
