#ifndef __NETPLAYIMPL
#define __NETPLAYIMPL

#include "Brawlback.h"

namespace Netplay {

    void StartMatching();
    bool CheckIsMatched();
    void EndMatch();

    bool IsInMatch();
    void SetIsInMatch(bool isMatch);

    int getLocalPlayerIdx();
    GameSettings& getGameSettings();

    extern u8 localPlayerIdx;
    extern const u8 localPlayerIdxInvalid;
}


#endif