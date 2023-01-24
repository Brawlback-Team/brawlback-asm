# Setting up CLion

1. Open CLion
2. Clone this repository in CLion 
   1. make a new project
   2. go to VCS (at the top bar) ==> Git ==> pull
    <img src="..\README_Resources\VCS_Pull_Path.png" alt="VCS Pull Path"  />

3. Go to File ==> Settings
4. Setup the toolchain
   1. go to "Toolchains"
   2. Add a new toolchain and name it MinGW
      1. technically the name doesn't matter it just makes things consistent
   3. under "environment," browse for and select the MinGW installation:
      1. for me, it's `C:\Program Files (x86)\mingw-w64\i686-8.1.0-posix-dwarf-rt_v6-rev0\mingw32`
   4. under "C++ Compiler," select the compiler that came with this repository: `./BuildSystem/Compiler/bin/powerpc-eabi-g++.exe`
5. Configure CMake
   1. if it doesn't already exist, make a new profile entitled "Debug-MinGW"
   2. Set the build type to "Debug"   
   3. for toolchains, Select your newly-made MinGW toolchain 
   4. under CMake options, copy and paste the following:
      1. `-DCMAKE_CXX_COMPILER_WORKS=1`
      2. this will just tell CMake that, yes, the compiler *does* work and *no* there shouldn't be any problems with it

With that out of the way, you should be able to go back to the main guide to figure out how codes work

- [Back to setup](../README.md)
