#ifndef PROJECTMCODES_EXIPACKET_H
#define PROJECTMCODES_EXIPACKET_H

#include "stdtypes.h"

// Adapted code from Pine

enum EXIStatus
{
    STATUS_UNKNOWN = 0,
    STATUS_GAME_STARTED = 1,
    STATUS_GAME_ENDED = 2,
    STATUS_MATCH_STARTED = 3,
    STATUS_MATCH_ENDED = 4,
    RESULT_EFFECT_SUCCESS = 5,
    RESULT_EFFECT_FAILURE = 6,
    RESULT_EFFECT_UNAVAILABLE = 7,
    RESULT_EFFECT_RETRY = 8,
};


class EXIPacket {

public:
    // EXIStatus: EXIStatus enum (implicit cast to byte)
    EXIPacket(u8 EXIStatus, void* source, u32 size);
    EXIPacket(u32 size);
    ~EXIPacket();

    void Send();
    void Receive();

    void* source = nullptr;

private:

    u32 size = 0;

};


#endif //PROJECTMCODES_EXIPACKET_H
