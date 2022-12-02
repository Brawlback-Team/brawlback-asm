#ifndef PROJECTMCODES_GFSCENEMANAGER_H
#define PROJECTMCODES_GFSCENEMANAGER_H

struct gfSceneManager {
    char _spacer[0x320];
    static gfSceneManager* getInstance();
};

#define _getInstance_GF_SCENE_MANAGER ((gfSceneManager* (*)()) 0x8002d018)

#endif //PROJECTMCODES_GFSCENEMANAGER_H
