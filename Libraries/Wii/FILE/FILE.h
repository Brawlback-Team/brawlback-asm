//
// Created by johno on 7/1/2020.
//

#ifndef PROJECTMCODES_FILE_H
#define PROJECTMCODES_FILE_H


#include "stddef.h"

struct FILE {

};


#define WRITE ("w")
#define READ ("r")
#define APPEND ("a")


#define FAFOpen ((FILE* (*)(const char* filepath, const char* mode)) 0x803ebeb8)
#define FAFClose ((int (*)(FILE* file)) 0x803ebe8c)
#define FAFWrite ((size_t (*)(const void* data, size_t size, size_t count, FILE* stream)) 0x803ebf98)
#define FAFRead ((size_t (*)(const void* destination, size_t size, size_t count, FILE* stream)) 0x803ebee4)
#define FAFSeek ((u32 (*)(FILE* file, u32 offset, int origin)) 0x803ebee8)

FILE* fopen(const char* filepath, const char* mode=READ);
int fclose(FILE* f);
size_t fwrite(const void* data, size_t size, size_t count, FILE* stream);
size_t fread(const void* destination, size_t size, size_t count, FILE* stream);



//origin can be SEEK_SET, SEEK_CUR, or SEEK_END
//SEET_SET uses begining of file, SEEK_CUR uses current offset, SEEK_END uses end of file
#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2
s32 fseek(FILE* file, s32 offset, int origin=SEEK_SET);





#endif //PROJECTMCODES_FILE_H
