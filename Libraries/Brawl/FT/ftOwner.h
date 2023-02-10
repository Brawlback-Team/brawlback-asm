//
// Created by dareb on 7/25/2020.
//

#ifndef PROJECTMCODES_FTOWNER_H
#define PROJECTMCODES_FTOWNER_H

#include "Brawl/AI/aiInput.h"
#include "Fighter.h"

struct ftLog
{
    char _spacer[0x509];
};

struct ftOwnerData {
    int team;
    int pointTeam;
    float hitPointMax;
    char _spacer12[4];
    int infiniteScalingKind;
    int infiniteScalingSizeType;
    u8 fighterSubColor;
    u8 fighterColor;
    char _spacer13[10];
    float damage;
    char _spacer11[4];
    float startDamage;
    int deadCount;
    int stockCount;
    int p1BeatCount;
    int p2BeatCount;
    int p3BeatCount;
    int p4BeatCount;
    int p5BeatCount;
    int p6BeatCount;
    int p7BeatCount;
    unsigned int cheerDefaultFrame;
    short suicideCount;
    char _spacer2[2];
    int numCoins;
    int pickupCoins;
    int numGenerateCoins;
    int numLostCoins;
    char _spacer3[4];
    bool isLostPokemon1;
    bool isLostPokemon2;
    bool isLostPokemon3;
    u8 dragoonCount;
    char _spacer4[156];
    int ftKind;
    char _spacer5[891];
    bool onRebirth;
    float attackRatio;
    float damageRatio;
    float attackReactionMul;
    float damageReactionMul;
    float scale;
    float visibilityScale;
    float gravity;
    float autoHandi;
    int glowAttack;
    int glowAttackAdd;
    int glowDefense;
    int glowDefenseAll;
    float slipMul;
    float coinDropRate;
    float yoshiEggTimeMul;
    float resultWinRotY;
    char _spacer6[4];
    float startLr;
    Vec3f startPos;
    float trainerStartLr;
    Vec3f trainerStartPos;
    u8 startPointIndex;
    char _spacer7[771];
    int sealCount;
    char _spacer8[4];
    float specialGlowAttack;
    int specialWeaponGlowAttack;
    float shieldMaxAdd;
    float shieldRecoveryAdd;
    int shieldBreakFrameAdd;
    char _spacer9[4];
    float tabemonoHealAdd;
    float maxTomatoHealAdd;
    float heartHealAdd;
    char _spacer10[8];
    float slipMulSeal;
    int swimDownFrameAdd;
    float staminaMaxAdd;
    ftLog log;
};

struct aiInput;
struct ftOwner {
    double getDamage();
    void setDamage(double newValue, int shouldLog);
    bool isCpu();
    int getStockCount();
    void setStockCount(int newValue);

    // 0x0
    ftOwnerData* ownerDataPtr;
    // 0x4
    aiInput* ftInputPtr;
};

#define _getDamage_ftOwner ((double (*)(ftOwner * owner)) 0x8081c264)
#define _setDamage_ftOwner ((void (*)(double newValue, ftOwner * owner, int shouldLog)) 0x8081bdcc)
#define _isOperationCpu_ftOwner ((bool (*)(ftOwner * self)) 0x8081bdb0)
#define _getStockCount_ftOwner ((int (*)(ftOwner * self)) 0x8081c540)
#define _setStockCount_ftOwner ((void (*)(ftOwner * self, int newValue)) 0x8081c528)
#endif //PROJECTMCODES_FTOWNER_H
