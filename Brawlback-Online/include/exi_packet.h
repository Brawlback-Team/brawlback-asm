#pragma once
#include "utils.h"
#include "EXI_hooks.h"
#include <types.h>
namespace EXICommand
{
    const u8 CMD_UNKNOWN = 0U;

    // Online

    const u8 CMD_ONLINE_INPUTS = 1; // sending inputs from game to emulator
    const u8 CMD_CAPTURE_SAVESTATE = 2;
    const u8 CMD_LOAD_SAVESTATE = 3;

    const u8 CMD_FIND_OPPONENT = 5;
    const u8 CMD_START_MATCH = 13;
    const u8 CMD_SETUP_PLAYERS = 14;
    const u8 CMD_FRAMEDATA = 15; // game is requesting inputs for some frame
    const u8 CMD_TIMESYNC = 16;
    const u8 CMD_ROLLBACK = 17;
    const u8 CMD_FRAMEADVANCE = 18;

    const u8 CMD_REPLAY_START_REPLAYS_STRUCT = 19;
    const u8 CMD_REPLAY_REPLAYS_STRUCT = 20;
    const u8 CMD_REPLAYS_REPLAYS_END = 21;
    const u8 CMD_GET_NEXT_FRAME = 22;
    const u8 CMD_BAD_INDEX = 23;
    const u8 CMD_GET_NUM_REPLAYS = 24;
    const u8 CMD_SET_CUR_INDEX = 25;
    const u8 CMD_GET_START_REPLAY = 26;
    const u8 CMD_SEND_ALLOCS = 30;
    const u8 CMD_SEND_DEALLOCS = 31;
    const u8 CMD_SEND_DUMPALL = 32;
    const u8 CMD_SEND_FRAMECOUNTERLOC = 33;
    const u8 CMD_CANCEL_MATCHMAKING = 34;
    
    const u8 CMD_MATCH_END = 4;
    const u8 CMD_SET_MATCH_SELECTIONS = 6;

    const u8 CMD_TIMER_START = 7;
    const u8 CMD_TIMER_END = 8;
    const u8 CMD_UPDATE = 9;
    
    const u8 CMD_GET_ONLINE_STATUS = 10;
    const u8 CMD_CLEANUP_CONNECTION = 11;
    const u8 CMD_GET_NEW_SEED = 12;
}


class EXIPacket {
public:
    EXIPacket(u8 EXICmd, void* source, u32 size);
    EXIPacket(u8 EXICmd);
    EXIPacket();
    ~EXIPacket();
    bool Send();
    static void CreateAndSend(u8 EXICmd, void* source = (u8*)0x0, u32 size = 0);
    u8 getCmd();
private:
    u8* source;
    u32 size;
    u8 cmd;
};