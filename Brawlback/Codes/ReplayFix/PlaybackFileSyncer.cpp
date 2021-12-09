//
// Created by johno on 9/24/2020.
//

#include "PlaybackFileSyncer.h"

void PlaybackFileSyncer::tryLoadingFile(gfFileIORequest* fileIoRequest) {
    for(int i = 0; i < scheduledLoads.size(); i++) {
        if(scheduledLoads[i] == fileIoRequest->hash) {
            scheduledLoads.erase(i);
            return;
        }
    }

    for(int i = 0; i < encounteredLoads.size(); i++) {
        if(encounteredLoads[i]->hash == fileIoRequest->hash) {
            return;
        }
    }

    fileIoRequest->params &= ~IS_READY_PARAM_GF_FILE_IO_REQUEST;
    encounteredLoads.push(fileIoRequest);
}

void PlaybackFileSyncer::scheduleLoad(u16 loadHash) {
    if(isLoadEncountered(loadHash)) {
        removeScheduledLoad(loadHash);
    }
    else {
        scheduledLoads.push(loadHash);
    }
}

bool PlaybackFileSyncer::isLoadEncountered(u16 loadHash) {
    for(int i = 0; i < encounteredLoads.size(); i++) {
        if(encounteredLoads[i]->hash == loadHash) {
            return true;
        }
    }
    return false;
}

void PlaybackFileSyncer::removeScheduledLoad(u16 loadHash) {
    ASSERT(isLoadEncountered(loadHash));

    for(int i = 0; i < encounteredLoads.size(); i++) {
        if(encounteredLoads[i]->hash == loadHash) {
            encounteredLoads[i]->params |= IS_READY_PARAM_GF_FILE_IO_REQUEST;
            encounteredLoads.erase(i);
            return;
        }
    }

    ASSERT(false);
}

bool PlaybackFileSyncer::isWaiting() {
    return scheduledLoads.empty() == false;
}

void PlaybackFileSyncer::clear() {
    scheduledLoads.clear();
    encounteredLoads.clear();
}
