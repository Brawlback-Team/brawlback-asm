cmake_minimum_required (VERSION 3.15)

add_code(SLIPPIREPLAYS EXIPacket.cpp Replays.cpp Record.cpp Playback.cpp PlaybackMenu.cpp menu.cpp)
target_link_libraries(SLIPPIREPLAYS PUBLIC ${buildSystemDirectory}/Compiler/powerpc-eabi/lib/libstdc++.a PUBLIC ${buildSystemDirectory}/Compiler/powerpc-eabi/lib/libc.a)