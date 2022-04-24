//
// Created by johno on 7/2/2020.
//

#include "gfFileIO.h"

int gfFileIO::readSDFile() {
    return _readSDFile_gfFileIO(this);
}

gfFileIO::gfFileIO(const char* filePath, int openMode, size_t size, void* source, void* destination) {
    this->filepath = filePath;
    this->openMode = openMode;
    this->size = size;
    this->source = source;
    this->destination = destination;
}

int gfFileIO::writeSDFile() {
    return _writeSDFile_gfFileIO(this);
}
