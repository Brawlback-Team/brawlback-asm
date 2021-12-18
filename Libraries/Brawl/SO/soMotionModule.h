//
// Created by johno on 7/15/2020.
//

#ifndef PROJECTMCODES_SOMOTIONMODULE_H
#define PROJECTMCODES_SOMOTIONMODULE_H


struct CHR0 {
    char* getString() {
        auto thisINT = reinterpret_cast<unsigned int>(this);
        return (char*) (thisINT + this->stringOffset);
    }

    char _spacer[0x14];
    unsigned int stringOffset;
    char _spacer2[0x1C - 0x14 - 4];
    unsigned short animLength;
    
};

struct AnmObjChrRes {
    int* vtable;
    char _spacer[0x2C - 4];
    // 0x2C
    CHR0* CHR0Ptr;
};

struct soAnimChr {
    AnmObjChrRes* resPtr;
    // 0x4
    float animFrame;
    char _spacer[0x10 - 0x4 - 4];
    // 0x10
    float frameSpeedModifier;
};

struct soMotionModule {
    float getFrame();
    float getEndFrame();
    void changeMotionRequest(int* subAction);

    char _spacer[0x3C];
    // 0x3C
    soAnimChr mainAnimationData;

    char _spacer3[0x58 - 0x3C - sizeof(soAnimChr)];
    // 0x58
    int subAction;
};


#define _getFrame_soMotionModule ((float (*)(soMotionModule* self)) 0x8071f474)
#define _changeMotionRequest_soMotionModule ((void (*)(soMotionModule* self, int* subAction)) 0x80726cf8)
#define _getEndFrame_soMotionModule ((float (*)(soMotionModule* self)) 0x8071f714)

#endif //PROJECTMCODES_SOMOTIONMODULE_H
