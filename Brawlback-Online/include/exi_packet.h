#pragma once
#include <types.h>
namespace EXICommand
{
    const u8 CMD_UNKNOWN = 0U;

    // Online
    const u8 CMD_END_FRAME = 1;
    const u8 CMD_END_LOOP = 2;
    const u8 CMD_START_LOOP = 3;
    const u8 CMD_GET_PORT = 4;
    const u8 CMD_GET_REMOTE_INPUTS = 5;
    const u8 CMD_GET_LOCAL_INPUTS = 6;
    const u8 CMD_ROLLBACK_CHECK = 7;
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