//
// Created by johno on 7/1/2020.
//

#include "SD.h"


//needs to be global var or the symbol will be lost
//char WRITE[] = "w";

void writeToSDFile(const char* filepath, const void* data, size_t size) {
    //more logic here to get proper root directory
    FILE* file;
    file = fopen(filepath, WRITE);
    fwrite(data, 1, size, file);
    fclose(file);
}


//needs to be global var or the symbol will be lost
//char APPEND[] = "a";

void appendToSDFile(const char* filepath, const void* data, size_t size) {
    //more logic here to get proper root directory
    FILE* file;
    file = fopen(filepath, APPEND);
    fwrite(data, 1, size, file);
    fclose(file);
}


//char READ[] = "r";

void readFromSDFile(const char* filepath, void* destination, size_t size, size_t offset) {
    FILE* file;
    file = fopen(filepath, READ);
    if(offset != 0) {
        fseek(file, offset, SEEK_SET);
    }
    fread(destination, 1, size, file);
    fclose(file);
}