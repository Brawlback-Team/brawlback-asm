//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_SOCONTROLLERMODULEIMPL_H
#define PROJECTMCODES_SOCONTROLLERMODULEIMPL_H


struct soControllerModuleImpl {
    //This looks incorrect
    char _spacer[0x10];
    int framesSinceShieldPressed;
};

static_assert(sizeof(soControllerModuleImpl) == 0x14, "soControllerModuleImpl has incorrect size");

#endif //PROJECTMCODES_SOCONTROLLERMODULEIMPL_H
