#include "Utility.h"
#include "Debug.h"

vector<u8> uint16ToVector(u16 num)
{
    u8 byte0 = num >> 8;
    u8 byte1 = num & 0xFF;

    return vector<u8>({byte0, byte1});
}

vector<u8> uint32ToVector(u32 num)
{
    u8 byte0 = num >> 24;
    u8 byte1 = (num & 0xFF0000) >> 16;
    u8 byte2 = (num & 0xFF00) >> 8;
    u8 byte3 = num & 0xFF;

    return vector<u8>({byte0, byte1, byte2, byte3});
}
const char* bit_rep[16] = {
    "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
    "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111",
};

void print_byte(u8 byte)
{
    OSReport("%s%s", bit_rep[byte >> 4], bit_rep[byte & 0x0F]);
}
void print_half(u16 half) {
    u8 byte0 = half >> 8;
    u8 byte1 = half & 0xFF;

    print_byte(byte0);
    print_byte(byte1);
}
void print_word(u32 word) {
    u8 byte0 = word >> 24;
    u8 byte1 = (word & 0xFF0000) >> 16;
    u8 byte2 = (word & 0xFF00) >> 8;
    u8 byte3 = word & 0xFF;

    print_byte(byte0);
    print_byte(byte1);
    print_byte(byte2);
    print_byte(byte3);
}



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

void swapByteOrder(u64& val)
{
    u64 ull = val;
    ull = ((ull & 0x00000000FFFFFFFFull) << 32) | ((ull & 0xFFFFFFFF00000000ull) >> 32);
    ull = ((ull & 0x0000FFFF0000FFFFull) << 16) | ((ull & 0xFFFF0000FFFF0000ull) >> 16);
    ull = ((ull & 0x00FF00FF00FF00FFull) << 8)  | ((ull & 0xFF00FF00FF00FF00ull) >> 8);
    val = ull;
}





void AddValueToByteArray(u32 value, vector<u8> &Array)
{
	for (int i = 0; i < 4; i++) {
		Array.push((value >> (3 * 8)) & 0xFF);
		value <<= 8;
	}
}

void AddValueToByteArray(u16 value, vector<u8> &Array)
{
	for (int i = 0; i < 2; i++) {
		Array.push((value >> 8) & 0xFF);
		value <<= 8;
	}
}

void AddValueToByteArray(u8 value, vector<u8> &Array)
{
	Array.push(value);
}

void AddValueToByteArray(int value, vector<u8> &Array)
{
	for (int i = 0; i < 4; i++) {
		Array.push((value >> (3 * 8)) & 0xFF);
		value <<= 8;
	}
}

void AddValueToByteArray(short value, vector<u8> &Array)
{
	for (int i = 0; i < 2; i++) {
		Array.push((value >> 8) & 0xFF);
		value <<= 8;
	}
}

void AddValueToByteArray(char value, vector<u8> &Array)
{
	Array.push(value);
}