//
// Created by johno on 7/27/2020.
//

#include "CircularBuffer.h"

CircularBuffer::CircularBuffer(void* bufferStart, u32 size) {
    this->bufferStart = bufferStart;
    bufferEnd = ((char*) bufferStart) + size;
    reset();
}

void CircularBuffer::push(void* data, u32 size) {
    void* mem = reserve(size);
    memcpy(mem, data, size);
}

void CircularBuffer::clearToWrap() {
    if(wrapLocation == nullptr) {
        currentStart = currentEnd;
    }
    else {
        currentStart = bufferStart;
        wrapLocation = nullptr;
    }
}

u32 CircularBuffer::unbrokenSize() {
    if(wrapLocation == nullptr) {
        return ((char*) currentEnd) - ((char*) currentStart);
    }
    return ((char*) wrapLocation) - ((char*) currentStart);
}

void CircularBuffer::reset() {
    currentStart = bufferStart;
    currentEnd = bufferStart;
    isFull = false;
    wrapLocation = nullptr;
}

u32 CircularBuffer::unbrokenEmptySize() {
    if(wrapLocation == nullptr) {
        return ((char*) bufferEnd) - ((char*) currentEnd);
    }
    return ((char*) currentStart) - ((char*) currentEnd);
}

void* CircularBuffer::reserve(u32 size) {
    void* newEnd = ((char*) currentEnd) + size;
    void* data = currentEnd;
    if(newEnd > bufferEnd) {
        if(currentStart == currentEnd) {
            currentStart = bufferStart;
        }
        else {
            wrapLocation = currentEnd;
        }
        data = bufferStart;
        currentEnd = ((char*) bufferStart) + size;
    }
    else if(newEnd == bufferEnd) {
        wrapLocation = bufferEnd;
        currentEnd = bufferStart;
    }
    else {
        currentEnd = newEnd;
    }

    isFull = currentStart == currentEnd;

    return data;
}

void* CircularBuffer::pop(u32 size) {
    void* result = malloc(size);
    void* newStart = ((char*) currentStart) + size;
    if(wrapLocation != nullptr) {
        if(newStart > wrapLocation) {
            //Object is split, needs two memcopies
            u32 firstPartSize = ((char*) wrapLocation) - ((char*) currentStart);
            u32 secondPartSize = size - firstPartSize;
            memcpy(result, currentStart, firstPartSize);
            memcpy(((char*) result) + firstPartSize, bufferStart, secondPartSize);
            currentStart = ((char*) bufferStart) + secondPartSize;
            wrapLocation = nullptr;
            isFull = false;
            return result;
        }
    }

    //Object is not split
    memcpy(result, currentStart, size);
    currentStart = ((char*) currentStart) + size;
    if(currentStart == wrapLocation) {
        wrapLocation = nullptr;
        currentStart = bufferStart;
    }

    isFull = false;

    return result;
}

bool CircularBuffer::isEmpty() {
    return isFull == false && currentEnd == currentStart;
}
