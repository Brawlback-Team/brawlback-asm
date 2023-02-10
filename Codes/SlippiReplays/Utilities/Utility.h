#pragma once

#include "stdtypes.h"
#include <algorithm>
#include <cstring>
#include "Brawl/GF/gfSceneManager.h"

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

void swapByteOrder(u16& val);
void swapByteOrder(u32& val);
void swapByteOrder(u64& val);
void swapByteOrder(float& val);

#define changeNextScene ((void (*)(gfSceneManager* gfSceneManager)) 0x8002d020)
#define setNextScene ((void (*)(gfSceneManager* gfSceneManager, const char* name, int memLayout)) 0x8002d5ac)