#pragma once
#include <types.h>
namespace EXICommand
{
    const u8 CMD_UNKNOWN = 0U;

    // Online
    const u8 CMD_END_FRAME = 1;
    const u8 CMD_END_LOOP = 2;
    const u8 CMD_START_LOOP = 3;
    const u8 CMD_START_LOOP_SIZE = 8;
    const u8 CMD_GET_PORT = 4;
    const u8 CMD_GET_REMOTE_INPUTS = 5;
    const u8 CMD_GET_LOCAL_INPUTS = 6;
    const u8 CMD_ROLLBACK_CHECK = 7;
    const u8 CMD_LOAD_STATE = 9;
    const u8 CMD_LOAD_STATE_SIZE = 10;
    const u8 CMD_GET_MISSING_REGIONS = 11;
    const u8 CMD_START_LOOP_ROLLBACK = 12;
    const u8 CMD_SEND_INPUTS = 13;
    const u8 CMD_GET_CALLBACK_CODES = 14;
    const u8 CMD_EXECUTE_SAVE = 15;
    const u8 CMD_EXECUTE_LOAD = 16;
    const u8 CMD_EXECUTE_ADVANCE = 17;
}


class EXIPacket {
public:
    EXIPacket(u8 EXICmd, void* source, unsigned int size);
    EXIPacket(u8 EXICmd);
    EXIPacket();
    ~EXIPacket();
    bool Send();
    static void CreateAndSend(unsigned char EXICmd, void* source = NULL, unsigned int size = 0);
    u8 getCmd();
private:
    u8* source;
    unsigned int size;
    u8 cmd;
};