#pragma once

#include "stdtypes.h"
#include "Containers/vector.h"
#include "Containers/Queue.h"


vector<u8> uint16ToVector(u16 num);
vector<u8> uint32ToVector(u32 num);
void print_byte(u8 byte);
void print_half(u16 half);
void print_word(u32 word);

//void swapByteOrder(u8* val);
void swapByteOrder(u16* val);
void swapByteOrder(u32* val);
void swapByteOrder(u64* val);


// https://github.com/Fracture17/PowerPC-Assembly-Functions/blob/master/PowerPC%20Assembly%20Functions/PowerPC%20Assembly%20Functions.h

void AddValueToByteArray(u32 value, vector<u8> &Array);
void AddValueToByteArray(u16 value, vector<u8> &Array);
void AddValueToByteArray(u8 value, vector<u8> &Array);
void AddValueToByteArray(int value, vector<u8> &Array);
void AddValueToByteArray(short value, vector<u8> &Array);
void AddValueToByteArray(char value, vector<u8> &Array);