
Based off framework by Fracture and Fudgepop01
https://github.com/Fracture17/ProjectMCodes



# Building

First, make sure to include your SD card contents in `SDCard/Project+`. This folder is gitignored (since its really big), so you'll have to provide it yourself


Next, there are a few paths you'll have to change to get things building.
- in `build.bat` you'll want to change the cmake exe path variable to point to your cmake.exe.
- in `scripts/VSDSync/Config.ini`, you'll want to change `BUILD_DIR` to point to this project folder, `SD_CARD_PATH` to point to your sd.raw, and `DOLPHIN_PATH` to point to your dolphin executable

That should be it, if you're trying to get this building and something isn't working, let me know.