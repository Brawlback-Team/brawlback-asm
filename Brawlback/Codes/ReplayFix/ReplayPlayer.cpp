//
// Created by johno on 9/24/2020.
//

#include "ReplayPlayer.h"


ReplayPlayer::ReplayPlayer(ReplayEvent* buffer, u32 bufferSize)
        : fileIO(buffer, bufferSize) {
}

ReplayGameStartEvent* ReplayPlayer::getGameStartEvent() {
    //for now, should always be first event if it exists, might change in future
    return (ReplayGameStartEvent*) events[0];
    //return (ReplayGameStartEvent*) mainBuffer;
}

ReplayFrameStartEvent* ReplayPlayer::getFrameStartEvent() {
    for(int i = 0; i < events.size(); i++) {
        if(events[i]->id == ReplayEventID::frameStart) {
            return (ReplayFrameStartEvent*) events[i];
        }
    }
    return nullptr;
}

void ReplayPlayer::clear() {
    for(int i = 0; i < events.size(); i++) {
        delete events[i];
    }
    events.clear();
}


void ReplayPlayer::loadNextFrame() {
    clear();

    loadEventsToVector();
}

ReplayPreFrameFighterEvent* ReplayPlayer::getFighterEventFromPort(int port, bool createIfNotFound) {
    for(int i = 0; i < events.size(); i++) {
        if(events[i]->id == ReplayEventID::preFrame) {
            if(((ReplayPreFrameFighterEvent*) events[i])->port == port)
                return (ReplayPreFrameFighterEvent*) events[i];
        }
    }
    return nullptr;
}


void ReplayPlayer::loadEventsToVector() {
    ReplayEvent* event;
    do {
        event = (ReplayEvent*) fileIO.buffer.currentStart;
        event = (ReplayEvent*) fileIO.read(event->size);
        events.push(event);
    } while((event->id != ReplayEventID::frameEnd) && (event->id != ReplayEventID::gameStart) && (event->id != ReplayEventID::gameEnd));
}

void ReplayPlayer::openReplayFile(FILE* file) {
    fileIO.openForReading(file);
}

void ReplayPlayer::close() {
    fileIO.shouldClose = true;
    clear();
}


//if game end event exists, should be only event
ReplayGameEndEvent* ReplayPlayer::getGameEndEvent() {
    ASSERT(events.size() > 0);

    auto event = (ReplayGameEndEvent*) events[0];
    if(event->id != ReplayEventID::gameEnd) {
        return nullptr;
    }

    ASSERT(events.size() == 1);
    return (ReplayGameEndEvent*) event;
}

