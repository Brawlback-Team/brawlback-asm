//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_FTCONTROLLERMODULEIMPL_H
#define PROJECTMCODES_FTCONTROLLERMODULEIMPL_H


#include "Brawl/SO/soControllerModuleImpl.h"
#include "Brawl/SO/soModuleAccessor.h"
#include "Brawl/SO/soControllerImpl.h"


struct ftControllerModuleImpl: public soControllerModuleImpl {
    soControllerModuleImpl so;
    char _spacer[28];
    //0x30
    soControllerImpl controller;
    soControllerImpl controller2;
    char _spacer2[4];
    //0x14C
    //Seems to just be a ptr back to controller
    soControllerImpl* controllerPtr;
    char _spacer3[25];
};

#endif //PROJECTMCODES_FTCONTROLLERMODULEIMPL_H
