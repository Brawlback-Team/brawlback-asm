:: ============================================================================
:: Virtual SD card load settings
:: ============================================================================
@echo off

cd /d %~dp0

:: ============================================================================
:: Fetch settings
:: ============================================================================

:: Check Config.ini exists
if NOT EXIST config.ini goto:NoConfigError

:: Checks if all variables are set inside Config.ini
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
    :: The path to your Dolphin sd.raw file
    :: No error checking because main.bat will create an sd card if one is not set
    if %%a==SD_CARD_PATH set SD_CARD_PATH=%%b
    :: The drive letter the card should be mounted to (for the default example, it would be "Q:\")
    if %%a==SD_CARD_MOUNT_DRIVE_LETTER if NOT "%%b"=="" (set SD_CARD_MOUNT_DRIVE_LETTER=%%b) else (
        set NON_PRESENT_VAR=SD_CARD_MOUNT_DRIVE_LETTER
        goto:NoVarError
    )
    :: The size (in MB) of the virtual SD card
    if %%a==SD_CARD_SIZE if NOT "%%b"=="" (set SD_CARD_SIZE=%%b) else (
        set NON_PRESENT_VAR=SD_CARD_SIZE
        goto:NoVarError
    )
    :: The path of your custom mods build
    if %%a==BUILD_DIR if NOT "%%b"=="" (set BUILD_DIR=%%b) else (
        set NON_PRESENT_VAR=BUILD_DIR
        goto:NoVarError
    )
    :: Should files be purged during sync
    if %%a==PURGE if NOT "%%b"=="" (set PURGE=%%b) else (
        set NON_PRESENT_VAR=PURGE
        goto:NoVarError
    )
    :: Should the CLI be paused on completion
    if %%a==SHOW_RESULTS if NOT "%%b"=="" (set SHOW_RESULTS=%%b) else (
        set NON_PRESENT_VAR=SHOW_RESULTS
        goto:NoVarError
    )
    :: The folder CMAKE built to
    if %%a==CMAKE_BUILD_DIR if NOT "%%b"=="" (set CMAKE_BUILD_DIR=%%b) else (
        set NON_PRESENT_VAR=CMAKE_BUILD_DIR
        goto:NoVarError
    )
    :: The path to your Dolphin emulator
    if %%a==DOLPHIN_PATH if NOT "%%b"=="" (set DOLPHIN_PATH=%%b) else (
        set NON_PRESENT_VAR=DOLPHIN_PATH
        goto:NoVarError
    )
    :: Should the Dolphin emulator automatically launch
    if %%a==AUTO_LAUNCH if NOT "%%b"=="" (set AUTO_LAUNCH=%%b) else (
        set NON_PRESENT_VAR=DOLPHIN_PATH
        goto:NoVarError
    )
)



:: ============================================================================
:: Check for imdisk
:: ============================================================================

imdisk --version > NUL 2> NUL || goto :imdisk_install

goto :eof

:: ============================================================================
:: Install imdisk
:: ============================================================================
:imdisk_install
start /wait imdisk/imdiskinst.exe -y
pause
goto :eof

:NoConfigError
echo [91m ERROR: No Config.ini file [0m
echo Check to make sure you copied and renamed SAMPLE-Config.ini to Config.ini in MakeSD
echo.
pause > NUL 2> NUL
exit /b 1

:NoVarError
echo [91m ERROR: %NON_PRESENT_VAR% not set in Config.ini [0m
echo Check to make sure %NON_PRESENT_VAR% is set in MakeSD\Config.ini
echo.
pause > NUL 2> NUL
exit /b 1