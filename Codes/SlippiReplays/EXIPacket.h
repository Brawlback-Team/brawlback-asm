#ifndef PROJECTMCODES_EXIPACKET_H
#define PROJECTMCODES_EXIPACKET_H

#include "stdtypes.h"

// Adapted code from Pine

enum EXICommand
{
    START_REPLAYS_STRUCT = 19,
    REPLAYS_STRUCT = 20,
    ENDGAME = 21,
    GET_NEXT_FRAME = 22,
    BAD_INDEX = 23,
    GET_NUM_REPLAYS = 24,
    SET_CUR_INDEX = 25,
    GET_START_REPLAY = 26
};


class EXIPacket {

public:
    // EXICommand: EXICommand enum (implicit cast to byte)
    EXIPacket(u8 EXIStatus, void* source, u32 size);
    ~EXIPacket();

    void Send();
    void Receive();

    void* source = nullptr;

private:

    u32 size = 0;

};


#endif //PROJECTMCODES_EXIPACKET_H
