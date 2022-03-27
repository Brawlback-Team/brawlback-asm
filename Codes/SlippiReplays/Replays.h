#ifndef PROJECTMCODES_REPLAYS_H
#define PROJECTMCODES_REPLAYS_H
#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "Memory.h"
#include "Wii/PAD/PADStatus.h"
#include "Brawl/GF/GameFrame.h"
#include "Brawl/GF/gfApplication.h"
#include <Brawl/FT/ftManager.h>
#include <Brawl/GF/GameGlobal.h>
#include <Wii/mtRand.h>
#include <Brawl/IT/itManager.h>
#include "EXIPacket.h"
#include "Containers/vector.h"
#include "Wii/OS/OSInterrupt.h"

class Replays {
private:
    char** replays;
    u32 numReplays;
    u8* sizeOfReplays;

public:
    Replays(u32, u8*);
    char** GetReplays();
    u32 GetNumReplays();
    u8* GetSizeOfReplays();
    void SetReplays(char**);
    void SetNumReplays(u32);
    void SetSizeOfReplays(u8*);
};


#endif //PROJECTMCODES_REPLAYS_H
