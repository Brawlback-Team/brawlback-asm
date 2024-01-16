//
// Created by johno on 9/24/2020.
//

#ifndef PROJECTMCODES_PLAYBACKFILESYNCER_H
#define PROJECTMCODES_PLAYBACKFILESYNCER_H


#include <stdtypes.h>
#include <Brawl/GF/gfFileIORequest.h>
#include "Containers/vector.h"
#include "Debug.h"

class PlaybackFileSyncer {
public:
    void tryLoadingFile(gfFileIORequest* fileIoRequest);

    void scheduleLoad(u16 loadHash);

    bool isWaiting();

    void clear();

private:
    bool isLoadEncountered(u16 loadHash);
    void removeScheduledLoad(u16 loadHash);

    //these are the hashes of the load events that were already supposed to occur
    vector<u16> scheduledLoads;
    //these are references to files that have finsihed loading, but were not loaded yet in the recorded game
    vector<gfFileIORequest*> encounteredLoads;
};


#endif //PROJECTMCODES_PLAYBACKFILESYNCER_H
