The Dolphin in this project is able to connect with gdb.  This allows us to debug code at a C++ level.

Even without using C++ at all, it still lets us set conditional breakpoints and watchpoints, dump and restore chunks of memory with files, and print/set variables with arbitrary expressions.

To start, go to run->Edit Configurations in CLion.  Add a new GDB remote Debug configuration.
Set GDB to the powerpc-eabi-gdb.exe file in your BuildSystem/Compiler/bin directory.
Set "target remote args" to tcp:localhost:55020. 
Set the symbol file to IntermediateFiles/initFile in your build directory.

Click ok and boot up the Dolphin included in the repo.  Select a game, and it should start paused.
Run the debug configuration, and CLion will use GDB to connect to your Dolphin, which should unpause.

You can use CLion to debug the same way as any other program.
I would recommend using CLion to set breakpoints in c++ code and to visualize c++ objects, and the GDB command line for everything else.