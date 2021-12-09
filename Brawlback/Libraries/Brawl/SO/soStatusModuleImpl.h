//
// Created by dareb on 7/29/2020.
//

#ifndef PROJECTMCODES_SOSTATUSMODULEIMPL_H
#define PROJECTMCODES_SOSTATUSMODULEIMPL_H


#include "../../../Globals/stddef.h"
#include "soModuleAccessor.h"

struct soModuleAccessor;
struct soStatusModuleImpl {
    void changeStatusForce(u32 action, soModuleAccessor* accesser);

    char _spacer[0x06];

    // 0x06
    u16 previousAction;

    char _spacer2[0x34 - 0x06 - 4];

    // 0x34
    u32 action;

    char _spacer3[0x78 - 0x34 - 4];
    
    // 0x7F
    bool attackHasConnected;
};

#define _changeStatusForce_soStatusModuleImpl ((void (*)(soStatusModuleImpl* self, u32 actionID, soModuleAccessor* accesser)) 0x8077f8b0)


#endif //PROJECTMCODES_SOSTATUSMODULEIMPL_H
