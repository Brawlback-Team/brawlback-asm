//
// Created by johno on 9/27/2020.
//

#ifndef PROJECTMCODES_GFCRYPTOESP_H
#define PROJECTMCODES_GFCRYPTOESP_H


#include <stddef.h>
#include "Memory.h"

//Returns dynamically allocated encryption, blocking
void* encrypt(void* source, u32 size);

//Returns dynamically allocated decryption, blocking
void* decrypt(void* source, u32 size);


struct gfCryptoESP {
    gfCryptoESP();
    ~gfCryptoESP();

    //sets up member variables and encrypts in seperate thread
    //return value is 1 if no problems with arguments
    bool encrypt(void* source, u32 size, int heap=42);

    //sets up member variables and decrypts in seperate thread
    //return value is 1 if no problems with arguments
    //size needs to be a multiple of 16
    bool decrypt(void* buffer, u32 size, int heap=42);

    char _spacer2[8];

    //0x8
    OSThread thread;

    char _spacer[0x350 - sizeof(OSThread) - 8];

    //0x350
    void* inputBuffer;
    //0x354
    u32 inputSize;
    //0x358
    int heap;
    //0x35C
    //crypto operation, decrypt is 2
    int mode;
    //0x360
    //is true if done
    bool isDone;
    char _spacer3[3];
    //0x364
    //-1 during operation, -2 if failed, 0 if ok
    int status;
    //0x368
    //is dynamically allocated during operation
    void* resultBuffer;
    //0x36C
    u32 resultSize;
}__attribute__((packed, aligned(4)));


static_assert(offsetof(struct gfCryptoESP, inputBuffer) == 0x350, "gfCryptoESP is incorrectly aligned");
static_assert(offsetof(struct gfCryptoESP, resultSize) == 0x36C, "gfCryptoESP is incorrectly aligned");
static_assert(sizeof(gfCryptoESP) == 0x370, "gfCryptoESP is wrong size");


#define _CT_GF_CRYPTO_ESP ((void (*)(gfCryptoESP* self)) 0x8003cfd0)
//Val is flag for calling __dl/sr_common.0
//Not sure what that does, but replays pass -1 to make it not called
#define _DT_GF_CRYPTO_ESP ((void (*)(gfCryptoESP* self, int val)) 0x8003d054)
#define _encrypt_GF_CRYPTO_ESP ((bool (*)(gfCryptoESP* self, void* buffer, u32 size, int heap)) 0x8003d0f4)
#define _decrypt_GF_CRYPTO_ESP ((bool (*)(gfCryptoESP* self, void* buffer, u32 size, int heap)) 0x8003d154)

#endif //PROJECTMCODES_GFCRYPTOESP_H
