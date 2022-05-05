cmake_minimum_required (VERSION 3.15)

add_code(SLIPPIREPLAYS EXIPacket.cpp Record.cpp Playback.cpp menu.cpp)
target_link_libraries(SLIPPIREPLAYS etl)
