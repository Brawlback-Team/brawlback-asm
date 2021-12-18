//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_SOMODULEACCESSOR_H
#define PROJECTMCODES_SOMODULEACCESSOR_H


#include "Brawl/SO/StageObject.h"
#include "soControllerModuleImpl.h"
#include "soWorkManageModuleImpl.h"
#include "soPostureModuleImpl.h"
#include "soMotionModule.h"
#include "soStatusModuleImpl.h"
#include "soCollisionAttackModuleImpl.h"
#include "soKineticModuleGenericImpl.h"
#include "soGroundModuleImpl.h"
#include "soGenerateArticleManageModuleImpl.h"
#include "../FT/ftParamCustomizeModuleImpl.h"
#include "../FT/ftStopModuleImpl.h"
#include "soColorBlendModule.h"
#include "soAnimCmdModuleImpl.h"
#include "soResourceModuleImpl.h"


struct StageObject;
struct soGenerateArticleManageModuleImpl;
struct soStatusModuleImpl;

//Contains references to all modules in a StageObject
//The "so" prefix is the base module class
//Modules like ft are derived from the StageObject class
struct soModuleAccessor {
    char _spacer[8];
    //0x8
    StageObject* owner;
    //There should be an soModuleEnummeration class here, but I'm just going to list the modules directly for now
    //0x0 + 0xC = 0xC
    soResourceModuleImpl* resourceModule;
    char _spacer2[0x14 - 0xC - 4];

    //0x8 + 0xC = 0x14
    soMotionModule* motionModule;

    //0xC + 0xC = 0x18
    soPostureModuleImpl* postureModule;

    //0x10 + 0xC = 0x1C
    soGroundModuleImpl* groundModule;

    char _spacer3[0x28 - 0x1C - 4];
    //0x1C + 0xC = 0x28
    soCollisionAttackModuleImpl* collisionAttackModule;

    char _spacer4[0x50 - 0x28 - 4];
    // 0x44 + 0xC = 0x50
    ftStopModuleImpl* ftStopModule;

    char _spacer5[0x68 - 0x50 - 4];
    //0x5C + 0xC = 0x68
    soControllerModuleImpl* controllerModule;
    char _spacer6[0x70 - 0x68 - 4];
    //0x64 + 0xC = 0x70
    soWorkManageModuleImpl* workModule;
    char _spacer7[0x78 - 0x70 - 4];
    // 0x6C + 0xC = 0x78
    soAnimCmdModuleImpl* animCmdModule;
    char _spacer8[0x7C - 0x78 - 4];
    //0x70 + 0xC = 0x7C
    soStatusModuleImpl* statusModule;
    char _spacer9[0x80 - 0x7C - 4];
    //0x7C + 0xC = 0x88
    soKineticModuleGenericImpl* kineticModule;
    char _spacer10[0xC];
    //0x84 + 0xC = 0x90
    soGenerateArticleManageModuleImpl* generateArticleManageModule;
    char _spacer11[0xB8 - 0x90 - 4];
    //0xAC + 0xC = 0xB8
    soColorBlendModule* colorBlendModule;
    char _spacer12[0xD0 - 0xB8 - 4];
    //0xC4 + 0xC = 0xD0
    ftParamCustomizeModuleImpl* paramCustomizeModule;
    char _spacer13[4];
    // 0xCC + 0xC = 0xD8
    soModuleAccessor * moduleEnumeration;
};


#endif //PROJECTMCODES_SOMODULEACCESSOR_H
