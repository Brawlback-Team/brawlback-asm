//
// Created by johno on 7/18/2020.
//

#ifndef PROJECTMCODES_GX_H
#define PROJECTMCODES_GX_H

#include "../../../Globals/stddef.h"

//Alpha is ignored if not used
union GXColor {
    GXColor() = default;
    GXColor(u32 value): value(value) {};
    u32 value = 0;
    struct {
        u8 red;
        u8 green;
        u8 blue;
        u8 alpha;
    }__attribute__((packed, aligned(4)));
}__attribute__((packed, aligned(4)));

union WGPipe {
    vu8 U8;
    vs8 S8;
    vu16 U16;
    vs16 S16;
    vu32 U32;
    vs32 S32;
    vf32 F32;
};

enum GXPrimitive {
    //Draws a series of points. Each vertex is a single point.
    GX_POINTS = 0xB8,
    //Draws a series of unconnected line segments. Each pair of vertices makes a line.
    GX_LINES = 0xA8,
    //Draws a series of lines. Each vertex (besides the first) makes a line between it and the previous.
    GX_LINESTRIP = 0xB0,
    //Draws a series of unconnected triangles. Three vertices make a single triangle.
    GX_TRIANGLES = 0x90,
    //Draws a series of triangles. Each triangle (besides the first) shares a side with the previous triangle.
    //Each vertex (besides the first two) completes a triangle.
    GX_TRIANGLESTRIP = 0x98,
    //Draws a single triangle fan. The first vertex is the "centerpoint". The second and third vertex complete
    //the first triangle. Each subsequent vertex completes another triangle which shares a side with the previous
    //triangle (except the first triangle) and has the centerpoint vertex as one of the vertices.
    GX_TRIANGLEFAN = 0xA0,
    //Draws a series of unconnected quads. Every four vertices completes a quad. Internally, each quad is
    //translated into a pair of triangles.
    GX_QUADS = 0x80
};

//A primitive is forward facing if its vertices are clockwise to the viewer
enum GXCullMode {
    //Don't cull
    GX_CULL_NONE = 0,
    //Cull front facing primitives
    GX_CULL_FRONT = 1,
    //Cull back facing primitives
    GX_CULL_BACK = 2,
    //Cull all primitives
    GX_CULL_ALL = 3
};

enum GXAttr {
    GX_VA_PTNMTXIDX = 0,
    GX_VA_TEX0MTXIDX = 1,
    GX_VA_TEX1MTXIDX = 2,
    GX_VA_TEX2MTXIDX = 3,
    GX_VA_TEX3MTXIDX = 4,
    GX_VA_TEX4MTXIDX = 5,   
    GX_VA_TEX5MTXIDX = 6,
    GX_VA_TEX6MTXIDX = 7,
    GX_VA_TEX7MTXIDX = 8,
    // required for each index
    GX_VA_POS = 9,
    GX_VA_NRM = 10,
    GX_VA_CLR0 = 11,
    GX_VA_CLR1 = 12,
    GX_VA_TEX0 = 13,
    GX_VA_TEX1 = 14,
    GX_VA_TEX2 = 15,
    GX_VA_TEX3 = 16,
    GX_VA_TEX4 = 17,
    GX_VA_TEX5 = 18,
    GX_VA_TEX6 = 19,
    GX_VA_TEX7 = 20,
    GX_POSMTXARRAY = 21,
    GX_NRMMTXARRAY = 22,
    GX_TEXMTXARRAY = 23,
    GX_LIGHTARRAY = 24,
    GX_VA_NBT = 25,
    GX_VA_MAXATTR = 26,
    GX_VA_NULL = 0xFF
};

enum GXAttrType {
    // Input data is not used
    GX_NONE = 0,
    // Input data is set directly
    GX_DIRECT = 1,
    // Input data is set by a 8bit index
    GX_INDEX8 = 2,
    // Input data is set by a 16bit index
    GX_INDEX16 = 3
};

//compare function to use
enum GXCompare {
    //Never passes
    GX_NEVER = 0,
    GX_LESS = 1,
    GX_LEQUAL = 2,
    GX_EQUAL = 3,
    GX_GREATER = 4,
    GX_NEQUAL = 5,
    GX_GEQUAL = 6,
    //Always passes
    GX_ALWAYS = 7
};

enum GXAlphaOp {
    GX_AND = 0,
    GX_OR = 1,
    GX_XOR = 2,
    GX_XNOR = 3
};

enum GXClipMode {
    GX_CLIP_ENABLE = 0,
    GX_CLIP_DISABLE = 1
};

enum GXBlendType {
    // write input directly to EFB
    GX_BM_NONE = 0,
    // blend using blending equation
    GX_BM_BLEND = 1,
    // blend using boolean operation
    GX_BM_LOGIC = 2,
    // input subtracts from existing pixels
    GX_BM_SUBTRACT = 3,
    GX_MAX_BLENDMODE = 4
};

enum GXBlendControl {
    GX_BL_ZERO = 0,
    GX_BL_ONE = 1,
    GX_BL_SRCCLR = 2,
    GX_BL_DSTCLR = 2,
    GX_BL_INVSRCCLR = 3,
    GX_BL_INVDSTCLR = 3,
    GX_BL_SRCALPHA = 4,
    GX_BL_INVSRCALPHA = 5,
    GX_BL_DSTALPHA = 6,
    GX_BL_INVDSTALPHA = 7,

};

enum GXLoType {
    GX_LO_CLEAR = 0,
    GX_LO_AND = 1,
 	GX_LO_REVAND = 2,
 	GX_LO_COPY = 3,
 	GX_LO_INVAND = 4,
 	GX_LO_NOOP = 5,
 	GX_LO_XOR = 6,
 	GX_LO_OR = 7,
 	GX_LO_NOR = 8,
 	GX_LO_EQUIV = 9,
 	GX_LO_INV = 10,
 	GX_LO_REVOR = 11,
 	GX_LO_INVCOPY = 12,
 	GX_LO_INVOR = 13,
 	GX_LO_NAND = 14,
 	GX_LO_SET = 15
};

//Write to this to draw stuff
#define WG_PIPE ((WGPipe*) 0xCC008000)

#define _GXSetZMode ((void (*)(bool compareEnabled, GXCompare compareType, bool updateEnabled)) 0x801f4774)
#define _GXSetAlphaCompare ((void (*)(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1)) 0x801f3fd8)
//Width is in pixels / 6
//just set textOffsets to 0
#define _GXSetLineWidth ((void (*)(u8 width, int texOffsets)) 0x801f12ac)
//Width is in pixels / 6
//just set textOffsets to 0
#define _GXSetPointSize ((void (*)(u8 width, int texOffsets)) 0x801f12fc)
#define _GXSetCullMode ((void (*)(GXCullMode cullMode)) 0x801f136c)
#define _GXSetClipMode ((void (*)(GXClipMode clipMode)) 0x801f55ec)
#define _GXSetCompLoc ((void (*)(GXBlendType type, )) 0x801f47a8)
#define _GXSetBlendMode ((void (*)(GXBlendType type, GXBlendControl src_fact, GXBlendControl dst_fact, GXLoType op)) 0x801f46cc)

#define _GXBegin ((void (*)(GXPrimitive type, int format, u16 numVerts)) 0x801f1088)
#define _GXSetVtxDesc ((void (*)(GXAttr attr, GXAttrType type)) 0x801ef280)
#define _GXClearVtxDesc ((void (*)()) 0x801efb10)

#endif //PROJECTMCODES_GX_H
