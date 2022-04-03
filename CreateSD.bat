set ORIGINAL_DIR=%CD% 

cd /d %~dp0
call "%~dp0MakeSD\main.bat"

cd /d %ORIGINAL_DIR%
