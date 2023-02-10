#include "Utility.h"
#include "Debug.h"

// https://mklimenko.github.io/english/2018/08/22/robust-endian-swap/
void swapByteOrder(u16& val)
{
    u16 us = val;
    us = (us >> 8) |
         (us << 8);
    val = us;
}

void swapByteOrder(u32& val)
{
    u32 ui = val;
    ui = ((ui << 8) & 0xFF00FF00) | ((ui >> 8) & 0xFF00FF);
    ui = (ui << 16) | (ui >> 16);
    val = ui;
}
void swapByteOrder(float& val)
{
    u32 ui = *((u32*)&val); // pretend it's a u32
    ui = ((ui << 8) & 0xFF00FF00) | ((ui >> 8) & 0xFF00FF);
    ui = (ui << 16) | (ui >> 16);
    val = *((float*)&ui); // back to float
}

void swapByteOrder(u64& val)
{
    u64 ull = val;
    ull = ((ull & 0x00000000FFFFFFFFull) << 32) | ((ull & 0xFFFFFFFF00000000ull) >> 32);
    ull = ((ull & 0x0000FFFF0000FFFFull) << 16) | ((ull & 0xFFFF0000FFFF0000ull) >> 16);
    ull = ((ull & 0x00FF00FF00FF00FFull) << 8)  | ((ull & 0xFF00FF00FF00FF00ull) >> 8);
    val = ull;
}