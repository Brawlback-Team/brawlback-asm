#ifndef PROJECTMCODES_EXIPACKET_H
#define PROJECTMCODES_EXIPACKET_H

#include "stddef.h"

// Adapted code from Pine

enum EXIStatus
{
    // SEND
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
    NUM_PLAYERS = 31,
    STOCK_COUNT = 32,
    INDEX = 33,
    GET_NUMBER_REPLAY_FILES = 34,
    GET_REPLAY_FILES = 37,
    GET_REPLAY_FILES_SIZE = 38,
    GET_REPLAY_NAMES = 40,
    GET_REPLAY_NAMES_SIZE = 42,

    // RECEIVE
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
