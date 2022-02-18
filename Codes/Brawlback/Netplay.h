#ifndef __NETPLAYIMPL
#define __NETPLAYIMPL

#include "Brawlback.h"

namespace Netplay {

    bool CheckShouldStartNetplay();

    void StartMatch();
    void EndMatch();

    int getLocalPlayerIdx();
    GameSettings* getGameSettings();

    extern u8 localPlayerIdx;
    extern const u8 localPlayerIdxInvalid;
}


#endif