//
// Created by johno on 7/15/2020.
//

#include "soMotionModule.h"

float soMotionModule::getFrame() {
    return _getFrame_soMotionModule(this);
}

float soMotionModule::getEndFrame() {
    return _getEndFrame_soMotionModule(this);
}

void soMotionModule::changeMotionRequest(int* subAction) {
    return _changeMotionRequest_soMotionModule(this, subAction);
}