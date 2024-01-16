//
// Created by johno on 7/24/2020.
//

#ifndef PROJECTMCODES_ASYNCFILEIO_H
#define PROJECTMCODES_ASYNCFILEIO_H


#include <Wii/FILE/FILE.h>
#include "Wii/OS/OSThread.h"
#include "stdtypes.h"
#include "Assembly.h"
#include "CircularBuffer.h"
#include "Wii/OS/OSInterrupt.h"

//Asyncrounus buffered reads and writes to file
//No overflow checking, buffer must be big enough to account for delays and data size
class AsyncFileIO {
public:
    AsyncFileIO(void* buffer, u32 size);

    OSThread thread;
    FILE* file;
    bool reading = false;
    bool shouldCloseWhenFinished = false;
    bool shouldClose = false;
    bool fileEndReached = false;

    CircularBuffer buffer;

    void openForWriting(FILE* file);
    void openForReading(FILE* file);

    void* read(u32 size);
    void write(void* source, u32 size);

    void closeWhenBufferEmpty();

    void close();

    void run();
};

extern "C" void* _IOFunction(void* _self);


#endif //PROJECTMCODES_ASYNCFILEIO_H
