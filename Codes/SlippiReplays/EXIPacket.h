#ifndef PROJECTMCODES_EXIPACKET_H
#define PROJECTMCODES_EXIPACKET_H

#include "stddef.h"

// Adapted code from Pine

enum EXIStatus
{
    INPUTS = 17,
    STAGE = 18,
    RANDOM = 19,
    FIGHTER = 20,
    GAME = 21,
    ENDGAME = 22,
    STARTPOS = 23,
    POS = 24,
    STARTFIGHTER = 25,
    STICK = 26,
    ACTIONSTATE = 27,
    ITEM_IDS = 28,
    ITEM_VARIENTS = 29,
    ITEM_TYPE = 30
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
