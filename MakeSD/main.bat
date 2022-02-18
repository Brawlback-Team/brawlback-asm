:: ============================================================================
:: Virtual SD card main script
:: ============================================================================
@echo off
cls

cd /d %~dp0

::set MIN_EXEC_TIME=3

call settings.bat

IF EXIST "%SD_CARD_PATH%" goto :Continue
IF NOT EXIST "%SD_CARD_PATH%" goto :MakeSD

:MakeSD
echo  Creating a virtual SD card. . .
"mksdcard.exe" %SD_CARD_SIZE% "sd.raw"
move "sd.raw" "%SD_CARD_PATH%"
echo.
echo  Created.

:Continue
set PURGE_COMMAND=
if %PURGE%==1 (
    set PURGE_COMMAND=/PURGE
)

call mount.bat || goto error

ROBOCOPY "%BUILD_DIR:\=\\%" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\." ^
    /E ^
    /NS ^
    /NP ^
    /NJH ^
    %PURGE_COMMAND%
IF %ERRORLEVEL% GEQ 8 goto error

cd ../

".\GCTRM\GCTRealMate.exe" -q ".\GCTRM\Project+RSBE01.txt"
".\GCTRM\GCTRealMate.exe" -q ".\GCTRM\Project+BOOST.txt"
".\GCTRM\GCTRealMate.exe" -q ".\GCTRM\vBrawlRSBE01.txt"
".\GCTRM\GCTRealMate.exe" -q ".\GCTRM\vBrawlBOOST.txt"

COPY ".\GCTRM\Project+RSBE01.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\RSBE01.gct"
COPY ".\\GCTRM\Project+BOOST.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\BOOST.gct"
COPY ".\\GCTRM\vBrawlRSBE01.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\vBrawl\RSBE01.gct"
COPY ".\\GCTRM\vBrawlBOOST.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\vBrawl\BOOST.gct"

ROBOCOPY "%CMAKE_BUILD_DIR%" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\codes" /mir
ROBOCOPY "%CMAKE_BUILD_DIR%" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\vBrawl\codes" /mir

cd /d %~dp0

::timeout /t %MIN_EXEC_TIME% /nobreak > NUL

call unmount.bat || goto error

goto :eof

:error
color 0c
pause > NUL 2> NUL
color
goto :eof