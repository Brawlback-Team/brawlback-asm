//
// Created by johno on 10/25/2020.
//

#ifndef PROJECTMCODES_RANDOM1TO1ALTS_H
#define PROJECTMCODES_RANDOM1TO1ALTS_H

#include "Assembly.h"
#include "Wii/FILE/FILE.h"
#include "StageInfo.h"
#include "Containers/vector.h"
#include "Debug.h"
#include "Brawl/gmGlobalModeMelee.h"
#include "Wii/mtRand.h"

#define FLAG ((bool*) 0x9134C8F8)
#define ASL_BUTTONS ((PADButtons*) 0x800b9ea2)


u8 getGroupID();
vector<StageInfo> getStagesInGroup(u8 groupID);
int randi(int max);

#endif //PROJECTMCODES_RANDOM1TO1ALTS_H
