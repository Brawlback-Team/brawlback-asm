
#ifndef PROJECTMCODES_BASEITEM_H
#define PROJECTMCODES_BASEITEM_H

#include "brawlback-common/ItemIdName.h"
#include "Brawl/SO/StageObject.h"
#include "Brawl/SO/soModuleAccessor.h"

struct BaseItem : public StageObject {
    void warp(Vec3f* location);
    void throwAttack(Vec3f* speeds);
    int getParamI(int paramIdx);
    float getParamF(int paramIdx);
    u16 getItVariation();
    ItemIdName getItKind();
};


#define _warp_BaseItem ((void (*)(BaseItem * self, Vec3f* location)) 0x80998814)
#define _throwAttack_BaseItem ((void (*)(BaseItem * self, Vec3f* speeds)) 0x80998b1c)
#define _fGetParam_BaseItem ((float (*)(BaseItem * self, int paramIdx)) 0x80997248)
#define _iGetParam_BaseItem ((int (*)(BaseItem * self, int paramIdx)) 0x80997270)
#define _getItVariation_BaseItem ((u16 (*)(BaseItem * self)) 0x8098bfac)
#define _getItKind_BaseItem ((ItemIdName (*)(BaseItem * self)) 0x8098bfa4)


#endif //PROJECTMCODES_BASEITEM_H