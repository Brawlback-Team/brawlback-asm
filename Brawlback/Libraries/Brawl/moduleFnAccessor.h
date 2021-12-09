//
// Created by dareb on 9/19/2020.
//

#ifndef PROJECTMCODES_MODULEFNACCESSOR_H
#define PROJECTMCODES_MODULEFNACCESSOR_H

#include "ftCancelModule.h"

struct moduleFnAccessor {
    ftCancelModule* getFtCancelModule(void* ft);
    char _spacer[0x3A4];
    void* fn_getFtCancelModule;
};

#endif //PROJECTMCODES_MODULEFNACCESSOR_H
