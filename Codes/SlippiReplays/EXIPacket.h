#ifndef PROJECTMCODES_EXIPACKET_H
#define PROJECTMCODES_EXIPACKET_H

#include "stddef.h"

// Adapted code from Pine

enum EXIStatus
{
    INPUTS = 18,
    STAGE = 19,
    RANDOM = 20,
    FIGHTER = 21,
    GAME = 22,
    ENDGAME = 23,
    STARTPOS = 24,
    POS = 25,
    STARTFIGHTER = 26,
    STICK = 27,
    ACTIONSTATE = 28,
    ITEM_IDS = 29,
    ITEM_VARIENTS = 30,
    ITEM_TYPE = 31
};


class EXIPacket {

public:
    // EXIStatus: EXIStatus enum (implicit cast to byte)
    EXIPacket(u8 EXIStatus, void* source, u32 size);
    ~EXIPacket();

    void Send();
    void Receive();

    void* source = nullptr;

private:

    u32 size = 0;

};


#endif //PROJECTMCODES_EXIPACKET_H
