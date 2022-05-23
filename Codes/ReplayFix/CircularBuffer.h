//
// Created by johno on 7/27/2020.
//

#ifndef PROJECTMCODES_CIRCULARBUFFER_H
#define PROJECTMCODES_CIRCULARBUFFER_H


#include "stdtypes.h"
#include "Memory.h"

struct CircularBuffer {
    CircularBuffer(void* bufferStart, u32 size);

    void* bufferStart;
    void* bufferEnd;
    void* currentStart;
    void* currentEnd;
    void* wrapLocation = nullptr;
    bool isFull = false;

    //Treats data as an object, and ensures it isn't broken by wrapping
    void push(void* data, u32 size);

    //Result is dynamically allocated
    void* pop(u32 size);

    //pushes end ptr back by size, but does nothing to the actual memory
    //returns ptr to reserved memory
    void* reserve(u32 size);
    //If data wraps, clears everything until the end of the buffer, else clears everything
    //start = end, not begining of buffer
    void clearToWrap();
    //resets the data pointers completly
    //start = end = buffer start
    void reset();

    bool isEmpty();

    //If data wraps, returns size from start to end of buffer, else start to end
    u32 unbrokenSize();
    //Returns unbroken empty space
    u32 unbrokenEmptySize();
};


#endif //PROJECTMCODES_CIRCULARBUFFER_H
