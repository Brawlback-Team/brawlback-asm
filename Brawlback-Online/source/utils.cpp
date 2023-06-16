#include "utils.h"
#include "BrawlbackTypes.h"
#include "mem_exp_hooks.h"
namespace utils {
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
    asm void SaveRegs()
    {
        stw r0, 0x0004 (sp)
        mfctr r0
        stw r0, -0x0008 (sp)
        stfd f0, -0x0010 (sp)
        stfd f1, -0x0018 (sp)
        stfd f2, -0x0020 (sp)
        stfd f3, -0x0028 (sp)
        stfd f4, -0x0030 (sp)
        stfd f5, -0x0038 (sp)
        stfd f6, -0x0040 (sp)
        stfd f7, -0x0048 (sp)
        stfd f8, -0x0050 (sp)
        stfd f9, -0x0058 (sp)
        stfd f10, -0x0060 (sp)
        stfd f11, -0x0068 (sp)
        stfd f12, -0x0070 (sp)
        stfd f13, -0x0078 (sp)
        stwu sp, -0x00F8 (sp)
        stmw rtoc, 0x0008 (sp)
        blr	
    }
    asm void RestoreRegs()
    {
        lmw	rtoc, 0x0008 (sp)
        addi sp, sp, 248
        lfd f0, -0x0010 (sp)
        lfd f1, -0x0018 (sp)
        lfd f2, -0x0020 (sp)
        lfd f3, -0x0028 (sp)
        lfd f4, -0x0030 (sp)
        lfd f5, -0x0038 (sp)
        lfd f6, -0x0040 (sp)
        lfd f7, -0x0048 (sp)
        lfd f8, -0x0050 (sp)
        lfd f9, -0x0058 (sp)
        lfd f10, -0x0060 (sp)
        lfd f11, -0x0068 (sp)
        lfd f12, -0x0070 (sp)
        lfd f13, -0x0078 (sp)
        lwz r0, -0x0008 (sp)
        mtctr r0
        lwz r0, 0x0004 (sp)
        blr
    }

    asm void nop() 
    {
        nop
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
