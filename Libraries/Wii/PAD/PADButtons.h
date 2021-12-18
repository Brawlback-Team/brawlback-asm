#pragma once


enum PADButtonBits {
    Start = 0x1000,
    Y = 0x800,
    X = 0x400,
    B = 0x200,
    A = 0x100,
    L = 0x40,
    R = 0x20,
    Z = 0x10,
    UpDPad = 0x8,
    DownDPad = 0x4,
    RightDPad = 0x2,
    LeftDPad = 0x1
};

//This is the representation of the physical buttons pressed on a GC controller
union PADButtons {
    unsigned short bits;
    struct {
        unsigned _none: 3;
        unsigned Start: 1;
        unsigned Y: 1;
        unsigned X: 1;
        unsigned B: 1;
        unsigned A: 1;
        unsigned _none2: 1;
        unsigned L: 1;
        unsigned R: 1;
        unsigned Z: 1;
        unsigned UpDPad: 1;
        unsigned DownDPad: 1;
        unsigned RightDPad: 1;
        unsigned LeftDPad: 1;
    }__attribute__((packed, aligned(2)));
}__attribute__((packed, aligned(2)));