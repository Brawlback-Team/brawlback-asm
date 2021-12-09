//
// Created by johno on 7/24/2020.
//

#include "ReplayEvent.h"


ReplayFrameEndEvent::ReplayFrameEndEvent() {
    size = sizeof(ReplayFrameEndEvent);
    id = ReplayEventID::frameEnd;
}


ReplayFrameStartEvent::ReplayFrameStartEvent() {
    size = sizeof(ReplayFrameStartEvent);
    id = ReplayEventID::frameStart;
}


ReplayGameEndEvent::ReplayGameEndEvent() {
    size = sizeof(ReplayGameEndEvent);
    id = ReplayEventID::gameEnd;
}


ReplayGameStartEvent::ReplayGameStartEvent() {
    size = sizeof(ReplayGameStartEvent);
    id = ReplayEventID::gameStart;
}


ReplayLoadEvent::ReplayLoadEvent() {
    size = sizeof(ReplayLoadEvent);
    id = ReplayEventID::load;
}

ReplayPreFrameFighterEvent::ReplayPreFrameFighterEvent() {
    size = sizeof(ReplayPreFrameFighterEvent);
    id = ReplayEventID::preFrame;
}