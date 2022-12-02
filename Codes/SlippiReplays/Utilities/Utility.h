#pragma once

#include "stdtypes.h"
#include <algorithm>
#include <cstring>

//USE WITH CAUTION!!!
//buffer assumed to contain at least sizeof(T) bytes
//Should only be used with packed structures from brawlback-commons
//Fields in object need to have endianess corrected if sent between game <-> emulator
template<typename T>
T bufferToObject(const u8* buffer)
{
  T obj;
  memcpy(&obj, buffer, sizeof(T));
  return obj;
}
template <class T>
T swap_endian(T in)
{
    char *const p = reinterpret_cast<char *>(&in);
    for (size_t i = 0; i < sizeof(T) / 2; ++i)
        std::swap(p[i], p[sizeof(T) - i - 1]);
    return in;
}
