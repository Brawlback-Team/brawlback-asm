#ifndef PROJECTMCODES_EXIPACKET_H
#define PROJECTMCODES_EXIPACKET_H

#include "stddef.h"

// Adapted code from Pine

enum EXIStatus
{
    ENDGAME = 22,

    // SEND
    GET_START_REPLAYS_STRUCT = 18,
    GET_REPLAYS_STRUCT = 20,
    GET_NUMBER_REPLAY_FILES = 34,
    GET_REPLAY_FILES = 37,
    GET_REPLAY_FILES_SIZE = 38,
    GET_REPLAY_NAMES = 40,
    GET_REPLAY_NAMES_SIZE = 42,

    // RECEIVE
    START_REPLAYS_STRUCT = 19,
    REPLAYS_STRUCT = 21,
    NUM_REPLAYS = 35,
    REPLAYS = 36,
    REPLAY_FILES_SIZE = 39,
    REPLAY_NAMES = 41,
    REPLAY_NAMES_SIZE = 43
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
