//
// Created by johno on 9/24/2020.
//

#include "ReplayRecorder.h"


ReplayRecorder::ReplayRecorder(ReplayEvent* buffer, u32 bufferSize)
        : fileIO(buffer, bufferSize) {
}

//Expects event to be dynamically alocated
void ReplayRecorder::push(ReplayEvent* event) {
    events.push(event);
}

ReplayGameStartEvent* ReplayRecorder::getGameStartEvent() {
    //for now, should always be first event if it exists, might change in future
    return (ReplayGameStartEvent*) events[0];
    //return (ReplayGameStartEvent*) mainBuffer;
}

ReplayFrameStartEvent* ReplayRecorder::getFrameStartEvent() {
    for(int i = 0; i < events.size(); i++) {
        if(events[i]->id == ReplayEventID::frameStart) {
            return (ReplayFrameStartEvent*) events[i];
        }
    }
    return nullptr;
}

void ReplayRecorder::saveFrameEvents() {
    for(int i = 0; i < events.size(); i++) {
        fileIO.write(events[i], events[i]->size);
    }

    clear();
}

void ReplayRecorder::saveAndClose() {
    saveFrameEvents();
    fileIO.closeWhenBufferEmpty();
}

void ReplayRecorder::clear() {
    for(int i = 0; i < events.size(); i++) {
        delete events[i];
    }
    events.clear();
}

ReplayPreFrameFighterEvent* ReplayRecorder::getFighterEventFromPort(int port, bool createIfNotFound) {
    for(int i = 0; i < events.size(); i++) {
        if(events[i]->id == ReplayEventID::preFrame) {
            if(((ReplayPreFrameFighterEvent*) events[i])->port == port)
                return (ReplayPreFrameFighterEvent*) events[i];
        }
    }
    return nullptr;
}


void ReplayRecorder::openReplayFile(FILE* file) {
    fileIO.openForWriting(file);
}
