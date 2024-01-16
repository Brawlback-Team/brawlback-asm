//
// Created by johno on 9/23/2020.
//

#include "test_ReplayFix.h"


void ASSERT_FighterIsNotAlreadyInEventList(ReplayRecorder& eventManager, int port) {
    auto oldFighterEvent = eventManager.getFighterEventFromPort(port);
    ASSERT(oldFighterEvent == nullptr);
}
