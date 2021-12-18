# Setting up VSCode for C++ Brawl/P+ Development 

This one is a bit more involved because VSCode doesn't come with the stuff you need to develop by-default. However, it's free - plus I (fudge) can vouch that it's still really quite nice.

1. Install VSCode
2. Open it up and navigate to the extensions panel. By default this is on the left-hand side and it looks like 4 boxes with the top-right one apart from the others.
3. In the panel that appears, search for and install the following:
   - **C/C++** by Microsoft
   - **Better C++ Syntax** by Jeff Hykin
   - **CMake** by twxs
   - **CMake Tools** by Microsoft
4. Now comes time to setup the extensions. Normally that may be a bit painful to figure out, but fortunately fudge has provided you with the `.vscode` folder with the exact setup you need!
5. Copy and paste the `.vscode` folder in this directory to the root directory of the repository.
6. press `Ctrl + Shift + P` to open a menu called the "Command Palette."  
   - From here you can run commands related to extensions that may otherwise be invisible.
7. In the command palette, type in `CMake: Select a kit` and hit enter.
8. Scroll down to `local kit` 
   - (if you didn't put the `.vscode` folder at the root of the repository, this wouldn't be visible).
9. open the command palette again and type `CMake: Configure`
   - this will run everything necessary to get things setup with CMake
10. Finally, open the command palette and type `CMake: Build`
11. if that succeeds, you're done and can move on!

- [Back to setup](../README.md)