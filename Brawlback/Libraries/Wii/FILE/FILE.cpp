//
// Created by johno on 7/1/2020.
//

#include "FILE.h"


FILE* fopen(const char* filepath, const char* mode) {
    return FAFOpen(filepath, mode);
}

int fclose(FILE* f) {
    return FAFClose(f);
}

size_t fwrite(const void* data, size_t size, size_t count, FILE* stream) {
    return FAFWrite(data, size, count, stream);
}

size_t fread(const void* destination, size_t size, size_t count, FILE* stream) {
    return FAFRead(destination, size, count, stream);
}

s32 fseek(FILE* file, s32 offset, int origin) {
    return FAFSeek(file, offset, origin);
}