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

"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\GCTRealMate.exe" -q "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\Project+RSBE01.txt"
"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\GCTRealMate.exe" -q "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\Project+BOOST.txt"
"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\GCTRealMate.exe" -q "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\vBrawlRSBE01.txt"
"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\GCTRealMate.exe" -q "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\vBrawlBOOST.txt"

MOVE "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\Project+RSBE01.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\RSBE01.gct"
MOVE "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\Project+BOOST.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\BOOST.gct"
MOVE "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\vBrawlRSBE01.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\vBrawl\RSBE01.gct"
MOVE "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\GCTRM\vBrawlBOOST.gct" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\vBrawl\BOOST.gct"


::timeout /t %MIN_EXEC_TIME% /nobreak > NUL

call unmount.bat || goto error

goto :eof

:error
color 0c
pause > NUL 2> NUL
color
goto :eof