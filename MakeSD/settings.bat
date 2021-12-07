:: ============================================================================
:: Virtual SD card load settings
:: ============================================================================
@echo off

cd /d %~dp0

:: ============================================================================
:: Fetch settings
:: ============================================================================

for /f "tokens=1,2 delims==" %%a in (config.ini) do (
    :: The path to your Dolphin sd.raw file
    if %%a==SD_CARD_PATH set SD_CARD_PATH=%%b
    :: The drive letter the card should be mounted to (for the default example, it would be "Q:\")
    if %%a==SD_CARD_MOUNT_DRIVE_LETTER set SD_CARD_MOUNT_DRIVE_LETTER=%%b
    :: The size (in MB) of the virtual SD card
    if %%a==SD_CARD_SIZE set SD_CARD_SIZE=%%b
    :: The path of your custom mods build
    if %%a==BUILD_DIR set BUILD_DIR=%%b
    :: Should files be purged during sync
    if %%a==PURGE set PURGE=%%b
    :: Should the CLI be paused on completion
    if %%a==SHOW_RESULTS set SHOW_RESULTS=%%b
    :: The path to your Dolphin emulator
    if %%a==DOLPHIN_PATH set DOLPHIN_PATH=%%b
    :: Should the Dolphin emulator automatically launch
    if %%a==AUTO_LAUNCH set AUTO_LAUNCH=%%b
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
