//
// Created by johno on 9/24/2020.
//

#ifndef PROJECTMCODES_REPLAYRECORDER_H
#define PROJECTMCODES_REPLAYRECORDER_H


#include <Wii/FILE/FILE.h>
#include "ReplayEvent.h"
#include "Containers/vector.h"
#include "AsyncFileIO.h"

class ReplayRecorder {
public:
    ReplayRecorder(ReplayEvent* buffer, u32 bufferSize);

    //copies event to buffer
    void push(ReplayEvent* event);

    //only works at begining of game of course
    ReplayGameStartEvent* getGameStartEvent();
    ReplayFrameStartEvent* getFrameStartEvent();
    ReplayPreFrameFighterEvent* getFighterEventFromPort(int port, bool createIfNotFound=false);

    void clear();

    void openReplayFile(FILE* file);

    void saveFrameEvents();
    void saveAndClose();

    vector<ReplayEvent*> events;

    AsyncFileIO fileIO;
};


#endif //PROJECTMCODES_REPLAYRECORDER_H
