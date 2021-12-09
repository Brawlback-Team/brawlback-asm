//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_SD_H
#define PROJECTMCODES_SD_H


#include "FILE.h"


void writeToSDFile(const char* filepath, const void* data, size_t size);
void appendToSDFile(const char* filepath, const void* data, size_t size);
void readFromSDFile(const char* filepath, void* destination, size_t size, size_t offset=0);

#endif //PROJECTMCODES_SD_H
