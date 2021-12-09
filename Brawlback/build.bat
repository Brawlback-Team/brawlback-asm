@echo off

:: path to your cmake.exe
set cmake_exe_path="C:\Program Files\CMake\bin\cmake.EXE"

:: set target for this build. all means build everything, you can also specify a specific project
set buildTarget=all

:: cmake build - got this command from the console output of running cmake build from the command palette
set cmakebuild=%cmake_exe_path% --build %CD%/build --config Debug --target %buildTarget% -j 14 --
:: move build binaries into SD folder which can then be synced with VSDSync
set pymovefiles=py scripts/moveOutputToSDFolder.py
:: Sync SD folder in this project to the actual sd.raw by running VSDSync.exe
set vsdsync=%CD%/scripts/VSDSync/VSDSync.exe


%cmakebuild% && %pymovefiles% && %vsdsync%