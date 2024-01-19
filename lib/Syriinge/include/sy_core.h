#pragma once

#include <stddef.h>
#include <types.h>

extern "C" char MOD_PATCH_DIR[0x18];

namespace SyringeCore {

    struct Trampoline {
        u32 originalInstr; // original instruction
        u32 branch;        // branch to original func code + 4
    };

    class InjectionAbs {
    public:
        InjectionAbs()
        {
            moduleId = -1;
            tgtAddr = -1;
            originalInstr = -1;
        }
        char moduleId;
        u32 tgtAddr;
        u32 originalInstr;
    };

    // Func Replacements just needs to save original
    // instruction and a branch back.
    class Hook : public InjectionAbs {
    public:
        u32 branch;
        Trampoline* trampoline;
    };

    // Inline hooks require a stack frame and
    // simple branch return instead of a blr
    class InlineHook : public InjectionAbs {
    public:
        InlineHook()
        {
            instructions[0] = 0x9421FF80;
            instructions[1] = 0x7C0802A6;
            instructions[2] = 0x90010084;
            instructions[3] = 0xBC610008;
            instructions[4] = 0;
            instructions[5] = 0x80010084;
            instructions[6] = 0xB8610008;
            instructions[7] = 0x7C0803A6;
            instructions[8] = 0x38210080;
            instructions[9] = 0;
        }
        u32 instructions[10];
    };

    void syInit();
    void syInlineHook(const u32 address, const void* replacement, int moduleId = -1);
    void syInlineHookRel(const u32 offset, const void* replacement, int moduleId);
    void sySimpleHook(const u32 address, const void* replacement, int moduleId = -1);
    void sySimpleHookRel(const u32 offset, const void* replacement, int moduleId);
    void syReplaceFunc(const u32 address, const void* replacement, void** original, int moduleId = -1);
    void syReplaceFuncRel(const u32 offset, const void* replacement, void** original, int moduleId);
    void syReplaceFunction(const void* symbol, const void* replacement, void** original, int moduleId = -1);

}