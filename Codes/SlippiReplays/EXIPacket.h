#ifndef PROJECTMCODES_EXIPACKET_H
#define PROJECTMCODES_EXIPACKET_H

#include "stdtypes.h"

// Adapted code from Pine

enum EXICommand
{
    START_REPLAYS_STRUCT = 19,
    REPLAYS_STRUCT = 20,
    ENDGAME = 21
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
