//
// Created by johno on 6/6/2020.
//

#include "ControllerManager.h"


ControllerManager manager;

INJECTION("manageControllers", 0x80029560, R"(
    SAVE_REGS
    mr r3, r25
    bl manageControllers
    RESTORE_REGS
    addi r11, sp, 1328
)");

extern "C" void manageControllers(gfPadSystem* padSystem) {
    for(int i = 0; i < 4; i++) {
        //set new prev buttons
        manager.prevTrueButtons[i] = manager.trueButtons[i];
        //manager.prevTrueStickX[i] = manager.trueStickX[i];
        //manager.prevTrueStickY[i] = manager.trueStickY[i];
        //manager.prevClampedStickX[i] = manager.clampedStickX[i];
        //manager.prevClampedStickY[i] = manager.clampedStickY[i];
        //save current true
        manager.trueButtons[i] = padSystem->pads[i].buttons;
        manager.trueStickX[i] = padSystem->pads[i].stickX;
        manager.trueStickY[i] = padSystem->pads[i].stickY;
        //combine negations and persitent negations
        manager.negations[i].bits |= manager.persistentNegations[i].bits;
        manager.effectiveStickX[i] = clamp(manager.trueStickX[i], manager.clampMaxX[i], manager.clampMinX[i]);
        manager.effectiveStickY[i] = clamp(manager.trueStickY[i], manager.clampMaxY[i], manager.clampMinY[i]);
        //clear persistent negations for non pressed buttons
        manager.persistentNegations[i].bits &= padSystem->pads[i].buttons.bits;
        //negate
        padSystem->pads[i].buttons.bits &= ~manager.negations[i].bits;
        padSystem->pads[i].stickX = manager.effectiveStickX[i];
        padSystem->pads[i].stickY = manager.effectiveStickY[i];
        //clear negations
        manager.negations[i].bits = 0;
        manager.clampMaxX[i] = 0x7F;
        manager.clampMinX[i] = -128;
        manager.clampMaxY[i] = 0x7F;
        manager.clampMinY[i] = -128;
        //check for presses
        PADButtons difference = {(unsigned short) (manager.trueButtons[i].bits ^ manager.prevTrueButtons[i].bits)};
        manager.truePresses[i] = {(unsigned short) (difference.bits & manager.trueButtons[i].bits)};
    }
}

void ControllerManager::setButtonsToBeNegated(PADButtons buttons, int port) {
    negations[port].bits |= buttons.bits;
}

void ControllerManager::setPersisentNegations(PADButtons buttons, int port) {
    persistentNegations[port].bits |= buttons.bits;
}

void ControllerManager::clampStickX(signed char max, signed char min, int port) {
    clampMaxX[port] = max;
    clampMinX[port] = min;
}


void ControllerManager::clampStickY(signed char max, signed char min, int port) {
    clampMaxY[port] = max;
    clampMinY[port] = min;
}