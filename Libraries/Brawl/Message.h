//
// Created by johno on 7/13/2020.
//

#ifndef PROJECTMCODES_MESSAGE_H
#define PROJECTMCODES_MESSAGE_H


#include "stdtypes.h"
#include "Brawl/GF/gfCameraManager.h"
#include "Memory.h"
#include "Assembly.h"
#include "Wii/GX/GX.h"
#include "Graphics/Draw.h"
//TODO: relocate this
enum HEAPTYPE {
//    00 *Null
    SystemFW = 0x01,
    System = 0x02,
    Effect = 0x03,
    RenderFifo = 0x04,
    Sound = 0x05,
    Network = 0x06,
    WiiPad = 0x07,
    IteamResource = 0x08,
    InfoResource = 0x09,
    CommonResource = 0x0A,
    Replay = 0x0B,
    Tmp = 0x0C,
    Physics = 0x0D,
    ItemInstance = 0x0E,
    StageInstance = 0x0F,
//    *Null = 0x10,
    StageResoruce = 0x11,
    Fighter1Resoruce = 0x12,
    Fighter2Resoruce = 0x13,
    Fighter3Resoruce = 0x14,
    Fighter4Resoruce = 0x15,
    Fighter1Resoruce2 = 0x16,
    Fighter2Resoruce2 = 0x17,
    Fighter3Resoruce2 = 0x18,
    Fighter4Resoruce2 = 0x19,
    FighterEffect = 0x1A,
    Fighter1Instance = 0x1B,
    Fighter2Instance = 0x1C,
    Fighter3Instance = 0x1D,
    Fighter4Instance = 0x1E,
    FighterTechqniq = 0x1F,
    FighterKirbyResource1 = 0x20,
    FighterKirbyResource2 = 0x21,
    FighterKirbyResource3 = 0x22,
    AssistFigureResource = 0x23,
    ItemExtraResource = 0x24,
//    *Null = 0x25,
    PokemonResource = 0x26,
//    *Null = 0x27,
    InfoInstance = 0x28,
//    *Null = 0x29,
    MenuInstance = 0x2A,
//    *Null = 0x2B,
    CopyFB = 0x2C,
    GameGlobal = 0x2D,
    GlobalMode = 0x2E,
//    *Null = 0x2F,
    MeleeFont = 0x30,
//    *Null = 0x31,
    OverlayCommon = 0x32,
    OverlayStage = 0x33,
    OverlayMenu = 0x34,
    OverlayFighter1 = 0x35,
    OverlayFighter2 = 0x36,
    OverlayFighter3 = 0x37,
    OverlayFighter4 = 0x38,
//    *Null = 0x39,
    Thread = 0x3A,
};


//each of these colors a portion of the text, not sure which yet
//not sure if the fifth is nescassary
struct CharWriterTextColor {
    GXColor color1;
    GXColor color2;
    GXColor color3;
    GXColor color4;
    GXColor color5;
}__attribute__((packed, aligned(4)));

//FontData may not be the real name, and may not be used completly correctly
struct FontData {

};


typedef u16 UTF16;

typedef f32	Mtx[3][4];


//This is called a ton of things
//Anything with the ms prefix that has to do with printing
//This might be a derived class, but I'm going to treat them all as the same for now
//Total size is 0x200 bytes
struct Message {
    //run each frame before printing
    void setup();

    static void std2DView();

    //null terminated
    void printString(const char* characters);
    //null terminated
    void printStringUTF(const UTF16* characters);
    float printChar(const UTF16 character);
    void printGlyph(double xpos, double ypos, double zpos, FontData * TextureIndex);
    void setObjZCompare(int unk1, bool active);
    void allocMsgBuffer(int bufferSize, int unk1, HEAPTYPE heaptype);




    //0
    //seems to be a boolean flag for GX color mapping
    //takes up 4 bytes, should be set to 0 unless we find out what it means
    int _colorMap = 0;


    //0x4
    //seems to always be 0xFFFFFFFF
    //possibly used with GX color mapping
    u32 _mightAlsoBeColor = 0xFFFFFFFF;

    //0x8
    CharWriterTextColor textColor;

    //0x1C
    //seems to always be 0xFFFFFFFF
    u32 _mightAlsoBeColor2 = 0xFFFFFFFF;

    char _spacer[0x24 - 0x1C - 4];

    //use these to change font size
    //0x24
    float fontScaleX = 1;

    //0x28
    float fontScaleY = 1;

    //0x2c
    float xPos;

    //0x30
    float yPos;

    //0x34
    float zPos;

    //0x38
    //don't know what this is, but notes say to set it to 1 and leave it
    int _thingEqualToOne1 = 1;

    //0x3C
    //don't know what this is, but notes say to set it to 1 and leave it
    int _thingEqualToOne2 = 1;

//    // 0x40
//    u16 unknown_a = 0xCCCC;
//
//    // 0x42
//    u8 unknown_b = 0xFF;

    char _spacer2[0x43 - 0x3C - 4];

    // 0x43
    // appears to be a flag that tells if the message has fixed width
    // or not, and if so, uses the fixedWidth defined at 0x44
    char enableFixedWidth = 0;

    //0x44
    f32 fixedWidth = -1;

    //0x48
    FontData* font;

    //0x4C
    //might be to get it to actually print or something
    //always seems to be 1, and notes have it set to 1
    bool _flagThing = true;

    char _spacer3[0x50 - 0x4C - 1];

    //0x50
    //also changes scale of positions
    float scale = 1;

    char _spacer4[0x58 - 0x50 - 4];

    //0x58
    //always seems to be some value close or equal to 1
    //seems to affect text width
    float _fontWidthThing = 1;

    //0x5C
    //Set by SetEdge[ms10Char]
    float _edge = 0;

    //0x60
    //Set by SetEdge, each byte set individually
    char _edgeBytes[4];
//    unsigned char _edgeBytes[4] = {0, 0, 0, 0xFF};


    char _spacer5[0x68 - 0x60 - 4];


    //0x68
    //something to do with font
    //set to 1 in SetFont, but could be set to other values based on rtoc stuff
    float _fontThing = 1;

    char _spacer6[0x74 - 0x68 - 4];


    //0x74
    //values are in pixels
    //default is 0, 0, 640, 480
    //not sure if used to position message on screen or to clip message or what
    //seems to be relative to parent or something
    float screenStartX = 0;
    float screenStartY = 0;
    float screenEndX = 640;
    float screenEndY = 480;


    char _spacer7[0x8C - 0x74 - 4 * 4];


    //0x8C
    //not sure if this is the space between lines for newline or something else
    float _lineSpace = 0;

    char _spacer8[0x94 - 0x8C - 4];


    //0x94
    //might be a bool, but is 4 bytes
    //Seems to affect GX color mapping
    //Set to 0 by default using setDrawFlag[Message]
    int _drawFlag = 0;

    char _spacer9[0x1B8 - 0x94 - 4];


    //0x1B8
    //set to 0.5 in setDefaultEnv
    float _unknown1;

    //0x1BC
    //set to 0.95 in setDefaultEnv
    float _unknown2;

    char _spacer11[0x1C4 - 0x1BC - 4];

    //0x1C4
    //seems to be something set from a value from the messageBuffer
    bool _messageByte;

    char _spacer12[0x1D0 - 0x1C4 - 1];

    //0x1D0
    //seems to point to message buffer object
    //Has more stuff in it than just message, but not needed if manually printing characters, so leaving it void*
    void* _messageBuffer;

    char _spacer10[0x200 - 0x1D0 - 4];

}__attribute__((packed, aligned(4)));

//not 100% sure what the flags do, but color flag should be 0, and font flag should be 9
#define _setDefaultEnv_Message ((void (*)(Message* message, int _textColorFlagThing, int _fontFlagThing)) 0x8006a964)
#define _Print_Message ((float (*)(Message* message, const UTF16 character)) 0x8006fe50)
#define _setObjZCompare ((void (*)(Message* message, int comparetype, bool active)) 0x8006b660)

#define _std2DView ((void (*)()) 0x8006b360)
#define _Print_Glyph ((void (*)(double xpos, double ypos, double zpos, Message* self, FontData * TextureIndex)) 0x8007001c)

//These seem to be pointers to some currently loaded fonts
//These must be cleared and restored durign setup, or can crash
//crashes occur in between certain loads, like when a game ends
#define _FONT_THING1 ((void**) 0x805a0174)
#define _FONT_THING2 ((void**) 0x805a0178)

#define _FONT_SCALE_THING ((double*) 0x805a1a80)
#define _FONT_SCALE_THING2 ((double*) 0x805a2bc0)

//pretty sure this is melee font, which is always loaded
#define MELEE_FONT ((FontData*) 0x80497e44)

// not sure what these fonts are but they were defined
// and used in the same area as MELEE_FONT in ghidra
#define UNK_FONT ((FontData*) 0x80497ecc)
#define UNK_FONT2 ((FontData*) 0x80497ed0)
#define UNK_FONT3 ((FontData*) 0x80497ed4)


#define _GXLoadPosMtxImm ((void (*)(const Mtx* matrix, u32 id)) 0x801f51dc)

#endif //PROJECTMCODES_MESSAGE_H
