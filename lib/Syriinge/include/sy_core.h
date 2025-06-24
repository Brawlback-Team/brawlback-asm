#pragma once

#include <gf/gf_module.h>
#include <stddef.h>
#include <types.h>

#include "version.h"

extern "C" char MOD_PATCH_DIR[0x18];

class CoreApi;
namespace Syringe {
    struct PluginMeta {
        char NAME[20];
        char AUTHOR[20];
        Version VERSION;
        Version SY_VERSION;
        void (*PLUGIN_MAIN)(CoreApi* api);
    };
} // namespace Syringe

namespace SyringeCore {
    extern CoreApi* API;
    enum INJECT_TYPE {
        INJECT_TYPE_INVALID = -1,
        INJECT_TYPE_REPLACE = 0,
        INJECT_TYPE_INLINE = 1
    };

    struct Trampoline {
        Trampoline()
        {
            originalInstr = 0x60000000; // nop instruction
            branch = 0;
        }
        u32 originalInstr; // original instruction
        u32 branch;        // branch to original func code + 4
    };

    /**
     * @brief Abstract class all other injections inherit from
     */
    class InjectionAbs {
    public:
        INJECT_TYPE type;
        char moduleId;
        u32 tgtAddr;
        u32 originalInstr;

        InjectionAbs()
        {
            type = INJECT_TYPE_INVALID;
            moduleId = -1;
            tgtAddr = -1;
            originalInstr = 0x60000000; // nop instruction
        }
    };

    class Hook : public InjectionAbs {
    public:
        u32 branch;             // branch to our hook / replacement
        Trampoline* trampoline; // trampline to facilitate calling original function
    };

    class InlineHook : public InjectionAbs {
    public:
        InlineHook()
        {
            // Create a stack frame, a branch to our code, and a branch back

            instructions[0] = 0x9421FF70;  // stwu r1, -0x90(r1)
            instructions[1] = 0x90010008;  // stw r0, 0x8(r1)
            instructions[2] = 0xBC61000C;  // stmw r3, 0xC(r1)
            instructions[3] = 0x7C0802A6;  // mflr r0
            instructions[4] = 0x90010094;  // stw r0, 0x94(r1)
            instructions[5] = 0;           // <-- branch to hook
            instructions[6] = 0x80010094;  // lwz r0, 0x94(r1)
            instructions[7] = 0x7C0803A6;  // mtlr r0
            instructions[8] = 0x80010008;  // lwz r0, 0x8(r1)
            instructions[9] = 0xB861000C;  // lmw r3, 0xC(r1)
            instructions[10] = 0x38210090; // addi r1, r1, 0x90
            instructions[11] = 0;          // <--- branch back to original
        }
        u32 instructions[12];
    };

    /**
     * @brief Iterates over all loaded modules and attempts to apply registered hooks
     *
     */
    void applyRelHooks();

    /**
     * @brief Initializes the Syringe core systems.
     * @note This function must be called before running any hooking operations.
     */
    void syInit();

    /**
     * @brief Injects a hook at the target address.
     * @note Hooks injected via this function WILL automatically return execution to the original function.
     *
     * @param address address to inject our hook at
     * @param replacement pointer to the function to run
     * @param moduleId Optional. Only needed if this hook is inside a dynamically loaded module.
     */
    void _inlineHook(const u32 address, const void* replacement, int moduleId = -1);
    void _replaceFunc(const u32 address, const void* replacement, void** original, int moduleId = -1);
    int syLoadPlugins(const char* folder);

    typedef void (*ModuleLoadCB)(gfModuleInfo*);
}

class CoreApi {
public:
    /**
     * @brief Injects a hook at the target address.
     * @note Hooks injected via this function WILL automatically return execution to the original function.
     *
     * @param address address to inject our hook at
     * @param replacement pointer to the function to run
     */
    virtual void syInlineHook(const u32 address, const void* replacement);
    /**
     * @brief Injects an inline hook into a dynamically loaded module on load.
     * @note Hooks injected via this function WILL automatically return execution to the original function.
     *
     * @param offset offset inside the module's .text section to insert the hook
     * @param replacement pointer to the function to inject
     * @param moduleId ID of the target module
     */
    virtual void syInlineHookRel(const u32 offset, const void* replacement, int moduleId);
    /**
     * @brief Injects a simple hook at the target address.
     * @note Hooks injected through this function WILL NOT automatically branch back to the original after returning.
     *
     * @param address address to inject the hook at
     * @param replacement pointer to function the hook will point to
     */
    virtual void sySimpleHook(const u32 address, const void* replacement);
    /**
     * @brief Injects a simple hook into a dynamically loaded module on load.
     * @note Hooks injected through this function WILL NOT automatically branch back to the original after returning.
     *
     * @param offset offset inside the module's .text section to insert the hook
     * @param replacement pointer to function the hook will point to
     * @param moduleId ID of the target module
     */
    virtual void sySimpleHookRel(const u32 offset, const void* replacement, int moduleId);
    /**
     * @brief Replaces the function at the target address with the function pointed to by "replacement".
     * @note Replacement functions will not automatically call or return to the original function.
     * To call the original function, use the parameter "original"
     *
     * @param address address of the function to replace
     * @param replacement pointer to the replacement function
     * @param original pointer to the original function. Useful for calling the original behavior.
     */
    virtual void syReplaceFunc(const u32 address, const void* replacement, void** original);
    /**
     * @brief Replaces a function inside of a dynamically loaded module on load.
     * @note Replacement functions will not automatically call or return to the original function.
     * To call the original function, use the parameter "original"
     *
     * @param offset offset inside the module's .text section of the function to replace
     * @param replacement pointer to the replacement function
     * @param original pointer to the original function. Useful for calling the original behavior.
     * @param moduleId ID of the target module
     */
    virtual void syReplaceFuncRel(const u32 offset, const void* replacement, void** original, int moduleId);

    /**
     * @brief Registers a callback function that will be called whenever a module is loaded.
     */
    virtual void moduleLoadEventSubscribe(SyringeCore::ModuleLoadCB cb);
};