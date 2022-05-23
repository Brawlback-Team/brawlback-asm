//
// Created by johno on 9/27/2020.
//

#include "gfCryptoESP.h"
#include <cstring>

void* encrypt(void* source, u32 size) {
    auto crypto = gfCryptoESP();
    crypto.encrypt(source, size);
    crypto.thread.join();
    char* result = new char[crypto.resultSize];
    memmove(result, crypto.resultBuffer, crypto.resultSize);
    return result;
}

void* decrypt(void* source, u32 size) {
    auto crypto = gfCryptoESP();
    crypto.decrypt(source, size);
    crypto.thread.join();
    char* result = new char[crypto.resultSize];
    memmove(result, crypto.resultBuffer, crypto.resultSize);
    return result;
}


gfCryptoESP::gfCryptoESP() {
    _CT_GF_CRYPTO_ESP(this);
}

bool gfCryptoESP::encrypt(void* source, u32 size, int heap) {
    return _encrypt_GF_CRYPTO_ESP(this, source, size, heap);
}

bool gfCryptoESP::decrypt(void* buffer, u32 size, int heap) {
    return _decrypt_GF_CRYPTO_ESP(this, buffer, size, heap);
}

gfCryptoESP::~gfCryptoESP() {
    _DT_GF_CRYPTO_ESP(this, -1);
}

