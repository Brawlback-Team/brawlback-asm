cmake_minimum_required(VERSION 3.15)

add_code(ReplayFix
        ReplayFix.cpp Record.cpp ReplayRecorder.cpp ReplayPlayer.cpp Play.cpp ReplayEvent.cpp
        AsyncFileIO.cpp CircularBuffer.cpp PlaybackFileSyncer.cpp)

add_subdirectory(Tests)
include_directories(Tests)