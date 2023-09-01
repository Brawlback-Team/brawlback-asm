#include "utils.h"
#include "BrawlbackTypes.h"
#include "mem_exp_hooks.h"
namespace Utils {
    bool setControls = false;
    u32 EncodeBranch(u32 start, u32 dest, bool linked)
    {
        u32 offset;
        if (start > dest)
        {
            offset = dest - start;
        }
        else
        {
            offset = -(start - dest);
        }
        u32 instr = 0x48000000 | offset & 0x3FFFFFF;
        return linked ? instr + 1 : instr;
    }
    u32 EncodeBranch(u32 start, u32 dest)
    {
        return EncodeBranch(start, dest, false);
    }
    void* myMemmove(void* dest, const void* src, bu32 n)
    {
        char *pDest = (char *)dest;
        const char *pSrc =( const char*)src;
        if(MemExpHooks::getFreeSize() < n)
        {
            return (char*)0x0;
        }
        //allocate memory for tmp array
        char *tmp  = (char *)MemExpHooks::mallocExp(sizeof(char ) * n);
        if(tmp == NULL)
        {
            return (char*)0x0;
        }
        else
        {
            unsigned int i = 0;
            for(i =0; i < n ; ++i)
            {
                *(tmp + i) = *(pSrc + i);
            }
            for(i =0 ; i < n ; ++i)
            {
                *(pDest + i) = *(tmp + i);
            }
            MemExpHooks::freeExp(tmp);
        }
        return dest;
    }
    __attribute__((naked)) void SaveRegs()
    {
        asm volatile(
            "stw 0, 0x0004 (1)\n\t"
            "mfctr 0\n\t"
            "stw 0, -0x0008 (1)\n\t"
            "stfd 0, -0x0010 (1)\n\t"
            "stfd 1, -0x0018 (1)\n\t"
            "stfd 2, -0x0020 (1)\n\t"
            "stfd 3, -0x0028 (1)\n\t"
            "stfd 4, -0x0030 (1)\n\t"
            "stfd 5, -0x0038 (1)\n\t"
            "stfd 6, -0x0040 (1)\n\t"
            "stfd 7, -0x0048 (1)\n\t"
            "stfd 8, -0x0050 (1)\n\t"
            "stfd 9, -0x0058 (1)\n\t"
            "stfd 10, -0x0060 (1)\n\t"
            "stfd 11, -0x0068 (1)\n\t"
            "stfd 12, -0x0070 (1)\n\t"
            "stfd 13, -0x0078 (1)\n\t"
            "stwu 1, -0x00F8 (1)\n\t"
            "stmw 2, 0x0008 (1)\n\t"
            "blr\n\t"
        );
    }
    __attribute__((naked)) void RestoreRegs()
    {
        asm volatile(
            "lmw 2, 0x0008 (1)\n\t"
            "addi 1, 1, 248\n\t"
            "lfd 0, -0x0010 (1)\n\t"
            "lfd 1, -0x0018 (1)\n\t"
            "lfd 2, -0x0020 (1)\n\t"
            "lfd 3, -0x0028 (1)\n\t"
            "lfd 4, -0x0030 (1)\n\t"
            "lfd 5, -0x0038 (1)\n\t"
            "lfd 6, -0x0040 (1)\n\t"
            "lfd 7, -0x0048 (1)\n\t"
            "lfd 8, -0x0050 (1)\n\t"
            "lfd 9, -0x0058 (1)\n\t"
            "lfd 10, -0x0060 (1)\n\t"
            "lfd 11, -0x0068 (1)\n\t"
            "lfd 12, -0x0070 (1)\n\t"
            "lfd 13, -0x0078 (1)\n\t"
            "lwz 0, -0x0008 (1)\n\t"
            "mtctr 0\n\t"
            "lwz 0, 0x0004 (1)\n\t"
            "blr\n\t"
        );
    }

    Vector<bu8> uint16ToVector(bu16 num)
    {
        bu8 byte0 = num >> 8;
        bu8 byte1 = num & 0xFF;
        Vector<bu8> vec;
        vec.push(byte0);
        vec.push(byte1);
        return vec;
    }

    Vector<bu8> uint32ToVector(bu32 num)
    {
        bu8 byte0 = num >> 24;
        bu8 byte1 = (num & 0xFF0000) >> 16;
        bu8 byte2 = (num & 0xFF00) >> 8;
        bu8 byte3 = num & 0xFF;
        Vector<bu8> vec;
        vec.push(byte0);
        vec.push(byte1);
        vec.push(byte2);
        vec.push(byte3);
        return vec;
    }
    const char* bit_rep[16] = {
        "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
        "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111",
    };

    void print_byte(bu8 byte)
    {
        OSReport("%s%s", bit_rep[byte >> 4], bit_rep[byte & 0x0F]);
    }
    void print_half(bu16 half) {
        bu8 byte0 = half >> 8;
        bu8 byte1 = half & 0xFF;

        print_byte(byte0);
        print_byte(byte1);
    }
    void print_word(bu32 word) {
        bu8 byte0 = word >> 24;
        bu8 byte1 = (word & 0xFF0000) >> 16;
        bu8 byte2 = (word & 0xFF00) >> 8;
        bu8 byte3 = word & 0xFF;

        print_byte(byte0);
        print_byte(byte1);
        print_byte(byte2);
        print_byte(byte3);
    }



    // https://mklimenko.github.io/english/2018/08/22/robust-endian-swap/
    void swapByteOrder(bu16& val)
    {
        bu16 us = val;
        us = (us >> 8) |
            (us << 8);
        val = us;
    }

    void swapByteOrder(bu32& val)
    {
        bu32 ui = val;
        ui = ((ui << 8) & 0xFF00FF00) | ((ui >> 8) & 0xFF00FF);
        ui = (ui << 16) | (ui >> 16);
        val = ui;
    }
    void swapByteOrder(float& val)
    {
        bu32 ui = *((bu32*)&val); // pretend it's a bu32
        ui = ((ui << 8) & 0xFF00FF00) | ((ui >> 8) & 0xFF00FF);
        ui = (ui << 16) | (ui >> 16);
        val = *((float*)&ui); // back to float
    }

    void swapByteOrder(u64& val)
    {
        u64 ull = val;
        ull = ((ull & 0x00000000FFFFFFFFull) << 32) | ((ull & 0xFFFFFFFF00000000ull) >> 32);
        ull = ((ull & 0x0000FFFF0000FFFFull) << 16) | ((ull & 0xFFFF0000FFFF0000ull) >> 16);
        ull = ((ull & 0x00FF00FF00FF00FFull) << 8)  | ((ull & 0xFF00FF00FF00FF00ull) >> 8);
        val = ull;
    }





    void AddValueToByteArray(bu32 value, Vector<bu8> &Array)
    {
        for (int i = 0; i < 4; i++) {
            Array.push((value >> (3 * 8)) & 0xFF);
            value <<= 8;
        }
    }

    void AddValueToByteArray(bu16 value, Vector<bu8> &Array)
    {
        for (int i = 0; i < 2; i++) {
            Array.push((value >> 8) & 0xFF);
            value <<= 8;
        }
    }

    void AddValueToByteArray(bu8 value, Vector<bu8> &Array)
    {
        Array.push(value);
    }

    void AddValueToByteArray(int value, Vector<bu8> &Array)
    {
        for (int i = 0; i < 4; i++) {
            Array.push((value >> (3 * 8)) & 0xFF);
            value <<= 8;
        }
    }

    void AddValueToByteArray(short value, Vector<bu8> &Array)
    {
        for (int i = 0; i < 2; i++) {
            Array.push((value >> 8) & 0xFF);
            value <<= 8;
        }
    }

    void AddValueToByteArray(char value, Vector<bu8> &Array)
    {
        Array.push(value);
    }
} // namespace utils
