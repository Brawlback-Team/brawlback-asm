//
// Created by johno on 7/15/2020.
//

#ifndef PROJECTMCODES_FTMANAGER_H
#define PROJECTMCODES_FTMANAGER_H

#include "Fighter.h"
#include "Brawl/IP/Inputs.h"
#include "Brawl/AI/aiScriptData.h"
#include "ftOwner.h"
#include "Brawl/AI/aiInput.h"
#include "ftEntryManager.h"

//the port of the fighter
typedef char playerNumber;

struct ftManager {
    playerNumber getPlayerNo(entryID entry);
    ftOwner* getOwner(entryID entry);
    entryID getEntryId(playerNumber playerNo);
    entryID getEntryIdFromIndex(int index);
    Fighter* getFighter(entryID entry, bool getFollower=false);
    unsigned int getFighterCount(entryID entry);
    unsigned int getFighterGmKind(entryID entry);
    aiInput* getInput(entryID entry);
    void setSlow(int excludeTeam, int unknown, int slowStrength, int durationInFrames);
    int getEntryCount();
    bool isCpuActive(entryID entry);

    char _spacer[0x154];
    ftEntryManager* entryManager;
//  ftSlotManager* slotManager;
//  ftDataProvider* dataProvider;

};

//static location of global ftManager object
#define FIGHTER_MANAGER ((ftManager*) 0x80629a00)

#define _getPlayerNo_ftManager ((playerNumber (*)(ftManager * self, entryID entry)) 0x80815ad0)
#define _getOwner_ftManager ((ftOwner* const (*)(ftManager * This, entryID entry)) 0x808159e4)
#define _getEntryID_ftManager ((entryID (*)(ftManager * self, playerNumber playerNo)) 0x80815c40)
#define _getEntryIDFromIndex_ftManager ((entryID (*)(ftManager * self, int index)) 0x80815bf8)
//fighterNo: -1 for load option from ftEntry, 0 for main fighter, 1 for follower
#define _getFighter_ftManager ((Fighter* (*)(ftManager * self, entryID entry, int fighterNo)) 0x80814f20)

//gets the number of fighters attached to the given fighter entryid (ex. ice climbers = 1)
#define _getFighterCount_ftManager ((unsigned int (*)(ftManager * self, entryID entry)) 0x80814ec4)

#define _getFighterGmKind_ftManager ((unsigned int (*)(ftManager * self, entryID entry)) 0x808154d8)

#define _getInput_ftManager ((aiInput* (*)(ftManager * self, entryID entry)) 0x80815a38)

//gets the number of fighters in a match
#define _getEntryCount_ftManager ((int (*)(ftManager * self)) 0x80815be4)

#define _setSlow_ftManager ((void (*)(ftManager * self, int excludeTeam, int unknown, int slowStrength, int durationInFrames)) 0x80817c48)

#define _isCpuActive_ftManager ((bool (*)(ftManager * self, entryID entry)) 0x80814e5c)

#endif //PROJECTMCODES_FTMANAGER_H
