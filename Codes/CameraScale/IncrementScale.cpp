//
// Created by dareb on 7/18/2020.
//
#include <Brawl/GF/gfCameraManager.h>
#include "Assembly.h"

INJECTION("incrementScale", 0x80018c30, R"(
    SAVE_REGS
    stfs f0, 0xD8(r31)
    bl incrementScale
    RESTORE_REGS
)");

float scaleIncrease = 0;
float increaseRate = 0.0001;

extern "C" void incrementScale() {
    CAMERA_MANAGER->cameras[0].scale += scaleIncrease;
    scaleIncrease += increaseRate;
}