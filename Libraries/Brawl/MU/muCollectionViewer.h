//
// Created by johno on 7/2/2020.
//

#ifndef PROJECTMCODES_MUCOLLECTIONVIEWER_H
#define PROJECTMCODES_MUCOLLECTIONVIEWER_H


#include "Assembly.h"
#include "muCollection.h"

struct muCollectionViewer {
    char _spacer[0x1AC];

    //0x1AC
    muCollection* resources;

    int getCurFileID();
    static void getFileHandle(char* buffer, muCollectionViewer* base, int fileID);
    void numPanel(int param_1, u8* param_2, int param_3);
    void createObjResFile(int param_1, char* param_2);
};


//not always loaded
#define _getCurFileID_muCollectionViewer ((int (*)(muCollectionViewer* self)) 0x811982d4)

//#define _getFileHandle_muCollectionViewer ((void (*)(char* buffer, muCollectionViewer* base, int fileID)) 0x81198350)
//edited so it takes a flag
#define _getFileHandle_muCollectionViewer ((void (*)(char* buffer, muCollectionViewer* base, int fileID, int flag)) 0x81198350)
#define _numPanel_muCollectionViewer ((void (*)(int param_1, u8* param_2, int param_3, muCollectionViewer* base)) 0x8119d264)
#define _createObjResFile_muCollectionViewer ((void (*)(int param_1, char* param_2, muCollectionViewer* base)) 0x8119c804)

#endif //PROJECTMCODES_MUCOLLECTIONVIEWER_H
