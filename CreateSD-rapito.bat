@echo off

:: set target for this build. all means build everything, you can also specify a specific project
set buildTarget=all

:: cmake build - got this command from the console output of running cmake build from the command palette
set cmakebuild=cmake --build %CD%/build --config Debug --target %buildTarget% -j 14 --

:: sync SD
set makesd=%CD%/MakeSD/main.bat
set makesd2=%CD%/MakeSD2/main.bat

xcopy /s /y  ".\BuildSystem\BrawlFuncMap.map" "C:\Users\rober\Documents\Dolphin Emulator\Maps\RSBE01.map"
xcopy /s /y  ".\build\Disassembly\Symbols.map" "C:\Users\rober\Documents\Dolphin Emulator\Maps\RSBE01.map"

echo ====================================
echo Building mod files...
echo ====================================

%cmakebuild% && %makesd% && %makesd2%
