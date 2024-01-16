//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_STAGEOBJECT_H
#define PROJECTMCODES_STAGEOBJECT_H

#include "soModuleAccessor.h"

//temp
struct gfTask {

};


typedef int entryID;
struct soModuleAccessor;

struct StageObject : public gfTask {
    //a bunch of arguments
    inline static auto ct = (StageObject* (*)()) 0x8070e274;

    char _spacer_so[0x60 - sizeof(gfTask)];
    //0x60
    soModuleAccessor* modules;
    
};

#endif //PROJECTMCODES_STAGEOBJECT_H
