//
// Created by johno on 7/2/2020.
//

#ifndef PROJECTMCODES_MUCOLLECTIONVIEWER_H
#define PROJECTMCODES_MUCOLLECTIONVIEWER_H


#include "Assembly.h"
#include "CLibs/cstring.h"
#include "muCollection.h"

struct muCollectionViewer {
    char _spacer[0x1AC];

    //0x1AC
    muCollection* resources;

    int getCurFileID();
    static void getFileHandle(char* buffer, muCollectionViewer* base, int fileID);
};


//not always loaded
#define _getCurFileID_muCollectionViewer ((int (*)(muCollectionViewer* self)) 0x811982d4)

//#define _getFileHandle_muCollectionViewer ((void (*)(char* buffer, muCollectionViewer* base, int fileID)) 0x81198350)
//edited so it takes a flag
#define _getFileHandle_muCollectionViewer ((void (*)(char* buffer, muCollectionViewer* base, int fileID, int flag)) 0x81198350)

#endif //PROJECTMCODES_MUCOLLECTIONVIEWER_H
