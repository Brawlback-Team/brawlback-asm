# ms_message.o

## function definitions

```c++
#define _constructor_ms_message ((Message * (*)(void * location, int unknown, HEAPTYPE type)) 0x800696b4)
#define _destructor_ms_message ((void (*)(void * location, HEAPTYPE type)) 0x800696b4)

//not 100% sure what the flags do, but color flag should be 0, and font flag should be 9
#define _setDefaultEnv_Message ((void (*)(Message* message, int _textColorFlagThing, int _fontFlagThing)) 0x8006a964)
#define _Print_Message ((void (*)(Message* message, const UTF16 character)) 0x8006fe50)
#define _std2DView ((void (*)()) 0x8006b360)

//These seem to be pointers to some currently loaded fonts
//These must be cleared and restored durign setup, or can crash
//crashes occur in between certain loads, like when a game ends
#define _FONT_THING1 ((void**) 0x805a0174)
#define _FONT_THING2 ((void**) 0x805a0178)

//pretty sure this is melee font, which is always loaded
#define MELEE_FONT ((FontData*) 0x80497e44)

// not sure what these fonts are but they were defined
// and used in the same area as MELEE_FONT in ghidra
#define UNK_FONT ((FontData*) 0x80497ecc)
#define UNK_FONT2 ((FontData*) 0x80497ed0)
#define UNK_FONT3 ((FontData*) 0x80497ed4)

#define __nw_srHeapType ((void * (*)(int size, HEAPTYPE type)) 0x8000c8b8)

#define _clearMsgBuff_ms_message ((void (*)(Message msg)) 0x8006b674)
#define _setMessageLocation_ms_message ((void (*)(Message msg, double x1, double x2, double y1, double y2)) 0x80069AF0)

// face values:
// 2: victory screen font
// 4: generic/pictochat font
#define _setFace_ms_message ((void (*)(Message msg, int face)) 0x8006A550)

#define _setFixedWidth_ms_message ((void (*)(Message msg, double width)) 0x8006A600)
#define _setColor_ms_message ((void (*)(Message msg, int color)) 0x8006A600)
#define _setScale_ms_message ((void (*)(Message msg, double xScale, double yScale)) 0x8006A018)
#define _setCursorX_ms_message ((void (*)(Message msg, double cursorX)) 0x80069970)
#define _setCursorY_ms_message ((void (*)(Message msg, double cursorY)) 0x80069A30)
#define _printf_ms_message ((void (*)(Message msg, char* text, ...)) 0x80069D40)

#define static_std2DView_ms_message ((void (*)()) 0x8006B360)
#define _printMsgBuf_ms_message ((void (*)(Message msg, int unknown)) 0x8006AB48)
#define _allocMsgBuffer_ms_message ((void (*)(Message * msg, int bufferSize, int unk1, HEAPTYPE heaptype)) 0x8006b400)
```

## default constructor
```c++
// ADDRESS: 0x80DA4400
struct Message {
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
    // 0xffffffff
    // 0xffffffff
    // 0xffffffff
    // 0xffffffff
    // 0xffffffff

    //0x1C
    //seems to always be 0xFFFFFFFF
    u32 _mightAlsoBeColor2 = 0xFFFFFFFF;
    
    char _spacer[0x24 - 0x1C - 4];
    // 0x00000000

    //0x24
    float fontScaleX = 1;

    //0x28
    float fontScaleY = 1;

    //0x2c
    float xPos = 0;

    //0x30
    float yPos = 0;

    //0x34
    float zPos = 0;

    //0x38
    //don't know what this is, but notes say to set it to 1 and leave it
    int _thingEqualToOne1 = 1;

    //0x3C
    //don't know what this is, but notes say to set it to 1 and leave it
    int _thingEqualToOne2 = 1;

    // 0x40
    u16 unknown_a = 0xCCCC;

    // 0x42
    u8 unknown_b = 0xFF;

    // 0x43
    // appears to be a flag that tells if the message has fixed width
    // or not, and if so, uses the fixedWidth defined at 0x44
    char enableFixedWidth = 1;

    //0x44
    f32 fixedWidth = 32;

    //0x48
    FontData* font = 0;

    //0x4C
    //might be to get it to actually print or something
    //always seems to be 1, and notes have it set to 1
    bool _flagThing = true;

    char _spacer3[0x50 - 0x4C - 1];
    // 0xCCCCCC

    //0x50
    //use this in general to scale font
    //also changes scale of positions
    float fontSize = 1;

    char _spacer4[0x58 - 0x50 - 4];
    // 0x0000CCCC

    //0x58
    //always seems to be some value close or equal to 1
    //seems to affect text width
    float _fontWidthThing = 1;

    //0x5C
    //Set by SetEdge[ms10Char]
    float _edge = 0;

    //0x60
    //Set by SetEdge, each byte set individually
    u8 _edgeBytes[4] = {0, 0, 0, 0xFF};

    char _spacer5[0x68 - 0x60 - 4];
    // 0x00000001

    //0x68
    //something to do with font
    //set to 1 in SetFont, but could be set to other values based on rtoc stuff
    float _fontThing = 1;

    char _spacer6[0x74 - 0x68 - 4] = {
            0x00CCCCCC
            0xCCCCCCCC
    };

    //0x74
    //values are in pixels
    //default is 0, 0, 640, 480
    //not sure if used to position message on screen or to clip message or what
    //seems to be relative to parent or something
    float screenStartX = 0;
    float screenStartY = 0;
    float screenEndX = 640;
    float screenEndY = 480;

    char _spacer7[0x8C - 0x74 - 4 * 4] = {
            0xCCCCCCCC
            0x00000000
    };


    //0x8C
    //not sure if this is the space between lines for newline or something else
    float _lineSpace = 0;

    char _spacer8[0x94 - 0x8C - 4] = { 0x00000004 };
    // 0x00000004

    //0x94
    //might be a bool, but is 4 bytes
    //Seems to affect GX color mapping
    //Set to 0 by default using setDrawFlag[Message]
    int _drawFlag = 0;

    char _spacer9[0x1B8 - 0x94 - 4] = {
            0x00000000,
            0x80454120,
            0x00000000,
            0x00000000
    };
    // tagProcessor pointer thing?
    // 0x80DA44A4 (ADDRESS + 0xA4)->0x80454360->tagProcessor

    // unknown
    // 0x80DA4380 (ADDRESS - 0x80)->unknown 

    // textWriterBase
    // appears to 
    // 0x80454120 
    //   ->(textWriterBase) 0x8059DB30
    //   ->(camera ?) 0x8059db28
    //   ->(char*) "Message"

    // tagProcessor
    // 0x80454360 ->0x8059db48->() 0x8045437C->(char*) "msTagProcessor"

    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xFFFFFFFF

    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xFFFFFFFF [7]

    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xFFFFFFFF

    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xFFFFFFFF [7]

    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xFFFFFFFF

    //0x1B8
    //set to 0.5 in setDefaultEnv
    float _unknown1 = 0xCCCCCCCC;
    // 0xCCCCCCCC

    //0x1BC
    //set to 0.95 in setDefaultEnv
    float _unknown2 = 0xCCCCCCCC;
    // 0xCCCCCCCC

    char _spacer11[0x1C4 - 0x1BC - 4] = {
            0xCCCCCCCC,
            0xCCCCCCCC
    };
    // 0xCCCCCCCC
    // 0xCCCCCCCC

    //0x1C4
    //seems to be something set from a value from the messageBuffer
    bool _messageByte = 1;

    char _spacer12[0x1D0 - 0x1C4 - 1];
    // 0xCCCCCC
    // 0x8006b360
    // 0x8006b360

    //0x1D0
    //seems to point to message buffer object
    //Has more stuff in it than just message, but not needed if manually printing characters, so leaving it void*
    void* _messageBuffer;
    // 0x80DA4380

    char _spacer10[0x200 - 0x1D0 - 4] = {
            0x00000000, // messageBufferPtr (1st)
            0x00000000,
            0x00000000,
            0xCCCCCCCC,
            0xCCCCCCCC,
            0xCCCCCCCC,
            0xCCCCCCCC,
            0xCCCCCCCC,
            0xCCCCCCCC,
            0xCCCCCCCC,
            0xCCCCCCCC,
    };
    // 0x80DA4380
    // 0x00000000
    // 0x00000000
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
    // 0xCCCCCCCC
}__attribute__((packed, aligned(4)));
```