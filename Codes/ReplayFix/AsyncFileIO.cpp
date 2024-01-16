//
// Created by johno on 7/24/2020.
//

#include "AsyncFileIO.h"



AsyncFileIO::AsyncFileIO(void* buffer, u32 size)
        : buffer(buffer, size) {
    thread = OSThread(_IOFunction, this, 0x1000, 0);
}


extern "C" void* _IOFunction(void* _self) {
    _OSDisableInterrupts();
    auto self = (AsyncFileIO*) _self;
    while(true) {
        if(self->file != nullptr) {
            u32 size;
            if(self->reading) {
                size = self->buffer.unbrokenEmptySize();
            }
            else {
                size = self->buffer.unbrokenSize();
            }

            if(size > 0) {
                if(self->reading) {
                    if(self->fileEndReached == false) {
                        void* data = self->buffer.reserve(size);
                        u32 bytesRead = fread(data, 1, size, self->file);
                        if(bytesRead < size) {
                            self->fileEndReached = true;
                        }
                    }
                } else {
                    void* data = self->buffer.currentStart;
                    self->buffer.clearToWrap();
                    fwrite(data, 1, size, self->file);
                }
            }
            else if(self->shouldCloseWhenFinished) {
                self->shouldClose = true;
                self->shouldCloseWhenFinished = false;
            }

            if(self->shouldClose) {
                self->close();
                self->shouldClose = false;
            }

            OSThread::sleepTicks(OSFramesToTicks(0.25));
        }
        else {
            self->thread.suspend();
        }
    }
}

void* AsyncFileIO::read(u32 size) {
    bool interruptStatus = _OSDisableInterrupts();
    //pop from buffer
    void* result = buffer.pop(size);
    if(fileEndReached && buffer.isEmpty()) {
        shouldClose = true;
    }
    _OSRestoreInterrupts(interruptStatus);
    return result;
}

void AsyncFileIO::write(void* source, u32 size) {
    bool interruptStatus = _OSDisableInterrupts();
    buffer.push(source, size);
    _OSRestoreInterrupts(interruptStatus);
}

void AsyncFileIO::run() {
    //This is a hack to make sure that _IOFunction actually exists as a code
    //If this isn't here, it will be removed, and the thread will call a nonexistant function
    auto _hack = _IOFunction;

    if(thread.isSuspended()) {
        thread.resume();
    }
}

void AsyncFileIO::openForWriting(FILE* file) {
    this->file = file;
    reading = false;
    shouldCloseWhenFinished = false;
    run();
}

void AsyncFileIO::closeWhenBufferEmpty() {
    shouldCloseWhenFinished = true;
}

void AsyncFileIO::close() {
    bool interruptStatus = _OSDisableInterrupts();
    fclose(file);
    file = nullptr;
    buffer.reset();
    _OSRestoreInterrupts(interruptStatus);
}

void AsyncFileIO::openForReading(FILE* file) {
    this->file = file;
    reading = true;
    shouldCloseWhenFinished = false;
    run();
}



