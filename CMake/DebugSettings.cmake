set(VERBOSE 1)

#can use -Og to shrink code size
#-O2 and -Os should also work, but don't right now for different reasons
set(CMAKE_CXX_FLAGS "-Og -ggdb3 -nostartfiles -fomit-frame-pointer -fno-unwind-tables -fno-stack-check -fno-function-cse -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-asynchronous-unwind-tables -std=c++17 -fno-builtin -ffreestanding -mcpu=750 -mmultiple -fno-inline -save-temps=obj -fverbose-asm -fno-threadsafe-statics")
