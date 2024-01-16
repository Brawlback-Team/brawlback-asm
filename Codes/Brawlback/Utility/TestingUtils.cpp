#include "TestingUtils.h"
#include "../Brawlback.h"




/*
INJECTION("gfCreateModuleHook", 0x800266c4, R"(
    SAVE_REGS
    bl createModuleTest
    RESTORE_REGS
)");
extern "C" void createModuleTest() {
    
}
*/

// hsd_padrumble inf loop
//INJECTION("rumbleInfLoopFix", 0x8002c4dc, "nop")



#if 0
// alloc/[gfMemoryPool]
INJECTION("allocTestHook", 0x80025c6c, R"(
    SAVE_REGS
    bl allocTest
    RESTORE_REGS

    lbz	r7, 0x0024 (r3)
)");

// p3 seems to be alignment
extern "C" void allocTest(void* p1, int p2, int p3) {
    OSReport("Alloc: (%p, %i, %i)\n", p1, p2, p3);

}


// free/[gfMemoryPool]
INJECTION("freeTestHook", 0x80025f50, R"(
    SAVE_REGS
    bl freeTest
    RESTORE_REGS

    mr	r29, r3
)");

extern "C" void freeTest(void* p1) {
    OSReport("Free: (%p)\n", p1);
}
#endif

/*
// Fudge's thing. (what does this do again?)
INJECTION("forceVisMemPool", 0x80025dc8, R"(
    cmpwi r3, 69
)");
*/


// ============ Always loads falco ==================
/*
//                               fighter  slot  css   cosmetic
static int hardcodedCharIDs[4] = { 0x13, 0x15, 0x13, 0x12 }; // falco

// override convertKind (end of func)
INJECTION("convertKindOverrideEndHook", 0x8085467c, R"(
    SAVE_REGS
    bl convertKindEnd
    RESTORE_REGS
    addi r1, r1, 32
)");
extern "C" void convertKindEnd(int p1, int* p2) {
    //u32 FighterID = p2[0];
    //u32 SlotID = p2[?];
    //u32 CosmeticID = p2[?];
    //u32 CSSID = p2[?];
    for (int i = 0; i < 4; i++) {
        write32((u32)&p2[i], hardcodedCharIDs[i]); 
    }
}
*/