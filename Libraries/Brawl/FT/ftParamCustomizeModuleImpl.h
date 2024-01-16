//
// Created by dareb on 7/29/2020.
//

#ifndef PROJECTMCODES_FTPARAMCUSTOMIZEMODULEIMPL_H
#define PROJECTMCODES_FTPARAMCUSTOMIZEMODULEIMPL_H


struct ftParamCustomizeModuleImpl {
    // 0x0
    char _spacer[0xC];
    // 0xC
    float walkInitVel;
    // 0x10
    float walkAcc;
    // 0x14
    float walkMaxVel;
    // 0x18
    float groundFriction;
    float dashInitVel;
    float dashRunAccA;
    float dashRunAccB;
    float dashRunTermVel;
    char unk1[0x4];
    float groundedMaxXVel;
    float dashCancelFrameWindow;
    float guardOnMaxMomentum;
    float jumpSquatFrames;
    float jumpXInitVel;
    float jumpYInitVel;
    float jumpXVelGroundMult;
    float jumpXInitTermVel;
    float jumpYInitVelShort;
    float airJumpXMult;
    float airJumpYMult;
    float footstoolInitVel;
    float footstoolInitVelShort;
    char unk2[0x4];
    float meteorCancelDelay;
    float numJumps;
    float gravity;
    float maxFallSpeed;
    float airFrictionY;
    float airYTermVel;
    float airMobilityA;
    float airMobilityB;
    float airXTermVel;
    float airFrictionX;
    float fastFallSpeed;
    float airXTermVelHard;
    float glideFrameWindow;
    char unk3[0x4];
    float jab2Window;
    float jab3Window;
    float ftilt2Window;
    float ftilt3Window;
    float fsmash2Window;
    float flipDirFrame;
    char unk4[0x4];
    float weight;
    float size;
    float resultsScreenSize;
    char unk5[0x8];
    float shieldSize;
    float shieldBreakVel;
    float shieldStrength;
    char unk6[0x4];
    float respawnPlatformSize;
    char unk7[0xC];
    float edgeJumpXVel;
    float edgeJumpYVel;
    char unk8[0x18];
    float itemThrowStrength;
    char unk9[0xC];
    float projectileItemMoveSpeed;
    float projectileItemMoveSpeedDashF;
    float projectileItemMoveSpeedDashB;
    char unk10[0x4];
    float lightLandingLag;
    float normalLandingLag;
    float nairLandingLag;
    float fairLandingLag;
    float bairLandingLag;
    float uairLandingLag;
    float dairLandingLag;
    float termVelHardFrames;
    float hipNBone;
    float tagHeightValue;
    char unk11[0x4];
    float walljumpXVel;
    float walljumpYVel;
    char unk12[0x4];
    float lhandNBone;
    float rhandNBone;
    char unk13[0x4];
    float waterYAcc;
    char unk14[0x14];
    float spitStarSize;
    float spitStarDamage;
    float eggSize;
    char unk15[0x1C];
    float hipNBone2;
    char unk16[0x10];
    float xRotNBone;
    char unk17[0x14];
    float cameraInitialYOffset;
    float cameraSizeFront;
    float cameraSizeBack;
    float cameraSizeTop;
    float cameraSizeBottom;
    char unk18[0x4];
    float zoomCameraSizeFront;
    float zoomCameraSizeBack;
    float zoomCameraSizeTop;
    float zoomCameraSizeBottom;
    float headNBone;
    char _spacer2[0x2dc - 0x220 - 4];
    // float pauseCameraZoomDistance;
    // float magnifyingGlassSize;
    // float weightDependentThrowBackward;
    // float weightDependentThrowForward;
    // float weightDependentThrowUp;
    // float weightDependentThrowDown;
};


#endif //PROJECTMCODES_FTPARAMCUSTOMIZEMODULEIMPL_H
