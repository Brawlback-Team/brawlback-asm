#ifndef __EXIPACKET
#define __EXIPACKET

#include "Utility/Utility.h"

enum EXICommand : u8
{
    CMD_UNKNOWN = 0,

    // Online

    CMD_ONLINE_INPUTS = 1,
    CMD_CAPTURE_SAVESTATE = 2,
    CMD_LOAD_SAVESTATE = 3,

    CMD_FIND_OPPONENT = 5,
    CMD_START_MATCH = 13,
    CMD_SETUP_PLAYERS = 14,
    CMD_FRAMEDATA = 15,
    CMD_TIMESYNC = 16,
    CMD_ROLLBACK = 17,

    CMD_GET_MATCH_STATE = 4,
    CMD_SET_MATCH_SELECTIONS = 6,

    CMD_TIMER_START = 7,
    CMD_TIMER_END = 8,
    CMD_UPDATE = 9,
    
    CMD_GET_ONLINE_STATUS = 10,
    CMD_CLEANUP_CONNECTION = 11,
    CMD_GET_NEW_SEED = 12,
};


class EXIPacket {

public:
    // EXICmd: EXICommand enum (implicit cast to byte)
    EXIPacket(u8 EXICmd, void* source, u32 size);
    EXIPacket(u8 EXICmd);
    EXIPacket();
    ~EXIPacket();

    bool Send();

    EXICommand getCmd();

private:

    u8* source = nullptr;
    u32 size = 0;
    EXICommand cmd = EXICommand::CMD_UNKNOWN;

};




#endif