#ifndef __EXIPACKET
#define __EXIPACKET

#include "stddef.h"

enum EXICommand
{
    CMD_UNKNOWN = 0,
    // Online
    CMD_ONLINE_INPUTS = 1,
    CMD_CAPTURE_SAVESTATE = 2,
    CMD_LOAD_SAVESTATE = 3,
    CMD_GET_MATCH_STATE = 4,
    CMD_FIND_OPPONENT = 5,
    CMD_SET_MATCH_SELECTIONS = 6,
    CMD_OPEN_LOGIN = 7,
    CMD_LOGOUT = 8,
    CMD_UPDATE = 9,
    CMD_GET_ONLINE_STATUS = 10,
    CMD_CLEANUP_CONNECTION = 11,
    CMD_SEND_CHAT_MESSAGE = 12,
    CMD_GET_NEW_SEED = 13,
    CMD_REPORT_GAME = 14,
};


class EXIPacket {

public:
    // EXICmd: EXICommand enum (implicit cast to byte)
    EXIPacket(u8 EXICmd, void* source, u32 size);
    ~EXIPacket();

    void Send();

private:

    u8* source = nullptr;
    u32 size = 0;

};




#endif