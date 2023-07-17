#pragma once

#include <types.h>
#include <vector.h>
#include <mem.h>
#include <OS/OSError.h>
#include "BrawlbackTypes.h"

namespace Utils {
    u32 EncodeBranch(u32 start, u32 dest, bool linked);
    u32 EncodeBranch(u32 start, u32 dest);

    void* myMemmove(void* dest, const void* src, bu32 n);

    __attribute__((naked)) void SaveRegs();
    __attribute__((naked)) void RestoreRegs();

    Vector<bu8> uint16ToVector(bu16 num);
    Vector<bu8> uint32ToVector(bu32 num);
    void print_byte(bu8 byte);
    void print_half(bu16 half);
    void print_word(bu32 word);

    void swapByteOrder(bu16& val);
    void swapByteOrder(bu32& val);
    void swapByteOrder(u64& val);
    void swapByteOrder(float& val);

    void AddValueToByteArray(bu32 value, Vector<bu8> &Array);
    void AddValueToByteArray(bu16 value, Vector<bu8> &Array);
    void AddValueToByteArray(bu8 value, Vector<bu8> &Array);
    void AddValueToByteArray(int value, Vector<bu8> &Array);
    void AddValueToByteArray(short value, Vector<bu8> &Array);
    void AddValueToByteArray(char value, Vector<bu8> &Array);
} // namespace utils

template<typename T>
T bufferToObject(u8* buffer)
{
  T obj;
  memmove(&obj, buffer, sizeof(T));
  return obj;
}
