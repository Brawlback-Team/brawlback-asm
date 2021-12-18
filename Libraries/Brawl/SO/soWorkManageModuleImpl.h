//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_SOWORKMANAGEMODULEIMPL_H
#define PROJECTMCODES_SOWORKMANAGEMODULEIMPL_H


#include "soGeneralWorkSimple.h"

class soWorkManageModuleImpl {
public:
    char _spacer[0x20];
    //0x20
    soGeneralWorkSimple* LAVariables;
    //0x24
    soGeneralWorkSimple* RAVariables;
    //0x28
    //seems to be something with IC variables
    //not sure what the structure is yet
};

#define _getInt_soWorkManageModuleImpl ((int (*)(void* self, unsigned int identifier)) 0x807ac9e0)

#endif //PROJECTMCODES_SOWORKMANAGEMODULEIMPL_H
