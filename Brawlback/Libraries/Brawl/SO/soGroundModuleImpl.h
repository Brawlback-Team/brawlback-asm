//
// Created by dareb on 7/29/2020.
//

#ifndef PROJECTMCODES_SOGROUNDMODULEIMPL_H
#define PROJECTMCODES_SOGROUNDMODULEIMPL_H

#include <Containers/Vec3f.h>

union xyDouble {
    double asDouble;
    struct {
        float xPos;
        float yPos;
    };
};

struct unk3_soGroundModule {
    char _spacer[0x14];

    // 0x14
    float landingCollisionBottomXPos;

    // 0x18
    float landingCollisionBottomYPos;
};

struct unk2_soGroundModule {
    char _spacer[0x8];

    // 0x8
    char airGroundState;


    char _spacer2[0x60 - 0x8 - 1];

    // 0x60
    // used in custom AI function 0x3D
    unk3_soGroundModule * unk1;
};

struct unk1_soGroundModule {
    char _spacer[0x10];

    // 0x28
    // used in custom AI function 0x3D
    unk2_soGroundModule * unk1;
};

struct soGroundModuleImpl {
    double getDistanceFromUnderGrCol(double maxDistance, Vec3f * unk, bool unkBool);
    unsigned int isPassableCheck(int unk);
    unsigned int isPassableGround(int unk);
    void setCorrect(int mode);
    xyDouble getLeftPos();
    xyDouble getRightPos();
    xyDouble getUpPos();
    xyDouble getDownPos();
    // xyDouble getDownCorrectPos();

    char _spacer2[0x28];

    // 0x28
    unk1_soGroundModule * unk1;

//    char _spacer2[0x24 - 0x1C - 4];

    // 0x24
    // used in custom AI function 0x4B / 0x4C
//    int * unk2;
};

#define _getDistanceFromUnderGrCol_soGroundModuleImpl ((double (*)(double maxDistance, soGroundModuleImpl * self, Vec3f * position, bool unkBool)) 0x80734f8c)
#define _setGrCollisisonMode ((void (*)(soGroundModuleImpl * self, int collisionMode)) 0x80730a04)
#define _setCorrect_soGroundModuleImpl ((void (*)(soGroundModuleImpl * self, int mode, int unk)) 0x80731324)
#define _isPassableGround_soGroundModuleImpl ((unsigned int (*)(soGroundModuleImpl * self, int unk)) 0x80731e44)
#define _isPassableCheck_soGroundModuleImpl ((unsigned int (*)(soGroundModuleImpl * self, int unk)) 0x80731b1c)

#define _getLeftPos_soGroundModuleImpl ((xyDouble (*)(soGroundModuleImpl * self, int unk)) 0x80733f9c)
#define _getRightPos_soGroundModuleImpl ((xyDouble (*)(soGroundModuleImpl * self, int unk)) 0x80733fe0)
#define _getUpPos_soGroundModuleImpl ((xyDouble (*)(soGroundModuleImpl * self, int unk)) 0x80733f14)
#define _getDownPos_soGroundModuleImpl ((xyDouble (*)(soGroundModuleImpl * self, int unk)) 0x80733f58)
// #define _getDownCorrectPos_soGroundModuleImpl ((xyDouble (*)(soGroundModuleImpl * self, int unk)) 0x80734184)

#endif //PROJECTMCODES_SOGROUNDMODULEIMPL_H
