#ifndef PROJECTMCODES_GFSCENEMANAGER_H
#define PROJECTMCODES_GFSCENEMANAGER_H


struct gfSceneManager {
    char _spacer[0x4];
    void* currentScene;
    char _spacer2[0x312];
    static gfSceneManager* getInstance();
};

#define _getInstance_GF_SCENE_MANAGER ((gfSceneManager* (*)()) 0x8002d018)

#endif //PROJECTMCODES_GFSCENEMANAGER_H
