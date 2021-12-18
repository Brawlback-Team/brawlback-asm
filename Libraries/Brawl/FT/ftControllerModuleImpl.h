//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_FTCONTROLLERMODULEIMPL_H
#define PROJECTMCODES_FTCONTROLLERMODULEIMPL_H


#include "Brawl/SO/soControllerModuleImpl.h"
#include "Brawl/SO/soModuleAccessor.h"
#include "Brawl/SO/soControllerImpl.h"


struct ftControllerModuleImpl: public soControllerModuleImpl {
    char _spacer_ft[0x2C - sizeof(soControllerModuleImpl)];
    //0x2C
    soModuleAccessor* modules;
    //0x30
    soControllerImpl controller;
    char _spacer_ft2[0x14C - 0x30 - sizeof(soControllerImpl)];
    //0x14C
    //Seems to just be a ptr back to controller
    soControllerImpl* controllerPtr;
};


#endif //PROJECTMCODES_FTCONTROLLERMODULEIMPL_H
