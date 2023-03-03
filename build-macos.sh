#bin/sh

# Move into the build directory, run CMake, and compile the project
mkdir -p build
cmake -B build/ -S . -DCMAKE_TOOLCHAIN_FILE=./CMake/PPCToolchain.cmake -DBRAWLBACK=1
cmake --build build/ -- -j $(sysctl -n hw.logicalcpu)

source ./sdcard-macos.sh