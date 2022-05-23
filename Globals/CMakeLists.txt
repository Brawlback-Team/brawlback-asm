cmake_minimum_required (VERSION 3.15)

add_code(Global Assembly.cpp Memory.cpp Debug.cpp Setup.cpp SystemFunctions.cpp)
target_link_libraries(Global Wii)