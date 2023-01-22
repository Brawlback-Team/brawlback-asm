set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ppc)
set(CMAKE_CROSSCOMPILING 1)

#TODO: rename buildSystem directory, sounds too much like SRC_DIR/BuildSystem, which it is not
# equal to on Linux
if(WIN32)
  set(buildSystemDirectory ${CMAKE_CURRENT_LIST_DIR}/BuildSystem)
else()
  set(buildSystemDirectory $ENV{DEVKITPPC})
endif()

set(CMAKE_CXX_COMPILER ${buildSystemDirectory}/bin/powerpc-eabi-g++)

set(CMAKE_CXX_STANDARD 17)

#Hard coding cmake build type to Debug because we don't have any reason 
#to something else - Is that correct?? TODO: ask on discord
set(CMAKE_BUILD_TYPE "Debug")
