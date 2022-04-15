cmake_minimum_required (VERSION 3.15)

add_code(SLIPPIREPLAYS EXIPacket.cpp Replay.cpp Record.cpp Playback.cpp PlaybackMenu.cpp menu.cpp)
target_link_libraries(SLIPPIREPLAYS etl)
