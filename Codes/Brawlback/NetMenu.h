#ifndef __NETMENU
#define __NETMENU

#include "Brawlback.h"

// #define _getEntryCount_ftManager ((int (*)(ftManager * self)) 0x80815be4)

// This tells the compiler that at the address `0x80815be4` there is a function 
// (which we'll name`_getEntryCount_ftManager`) which will return an `int` that takes a `ftManager` as an argument.

enum NetMatchMakingStatus : u32 {
    LinkDown = 0x0,
    LinkUp = 0x1,
    DWCReady = 0x2,
    WaitLogin = 0x3,
    Download = 0x4,
    Online = 0x5,
    MatchingStart = 0x6,
    Matching = 0x7,
    MatchingWaitShare = 0x8,
    P2P = 0x9,
    DisconnectAll = 0xa,
    WaitShutdown = 0xb,
    Error = 0xc,
};
#define setMatchingStatus (  ( void (*)(u32 matchingStatus) ) 0x80146fcc )


#define clearAppErrorStatus ( ( void (*)() ) 0x801473c4 )

#endif


