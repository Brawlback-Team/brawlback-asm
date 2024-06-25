#pragma once

#include <gf/gf_module.h>
#include <printf.h>
#include <sscanf.h>
#include <stddef.h>
#include <types.h>

#include "version.h"

extern "C" char MOD_PATCH_DIR[0x18];

namespace Syringe {
    struct PluginMeta {
        char NAME[20];
        char AUTHOR[20];
        Version VERSION;
        Version SY_VERSION;
    };
} // namespace Syringe

namespace SyringeCore {

    enum INJECT_TYPE {
        INJECT_TYPE_INVALID = -1,
        INJECT_TYPE_REPLACE = 0,
        INJECT_TYPE_INLINE = 1
    };

    struct Trampoline {
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
            originalInstr = -1;
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
            // Create a stack frame, a branch
            // to our code, and a branch back
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
    /**
     * @brief Injects a hook at the target address.
     * @note Hooks injected via this function WILL automatically return execution to the original function.
     *
     * @param address address to inject our hook at
     * @param replacement pointer to the function to run
     */
    void syInlineHook(const u32 address, const void* replacement);
    /**
     * @brief Injects an inline hook into a dynamically loaded module on load.
     * @note Hooks injected via this function WILL automatically return execution to the original function.
     *
     * @param offset offset inside the module's .text section to insert the hook
     * @param replacement pointer to the function to inject
     * @param moduleId ID of the target module
     */
    void syInlineHookRel(const u32 offset, const void* replacement, int moduleId);
    /**
     * @brief Injects a simple hook at the target address.
     * @note Hooks injected through this function WILL NOT automatically branch back to the original after returning.
     *
     * @param address address to inject the hook at
     * @param replacement pointer to function the hook will point to
     */
    void sySimpleHook(const u32 address, const void* replacement);
    /**
     * @brief Injects a simple hook into a dynamically loaded module on load.
     * @note Hooks injected through this function WILL NOT automatically branch back to the original after returning.
     *
     * @param offset offset inside the module's .text section to insert the hook
     * @param replacement pointer to function the hook will point to
     * @param moduleId ID of the target module
     */
    void sySimpleHookRel(const u32 offset, const void* replacement, int moduleId);
    /**
     * @brief Replaces the function at the target address with the function pointed to by "replacement".
     * @note Replacement functions will not automatically call or return to the original function.
     * To call the original function, use the parameter "original"
     *
     * @param address address of the function to replace
     * @param replacement pointer to the replacement function
     * @param original pointer to the original function. Useful for calling the original behavior.
     * @param moduleId Optional. Only needed if this hook is inside a dynamically loaded module.
     */
    void _replaceFunc(const u32 address, const void* replacement, void** original, int moduleId = -1);
    /**
     * @brief Replaces the function at the target address with the function pointed to by "replacement".
     * @note Replacement functions will not automatically call or return to the original function.
     * To call the original function, use the parameter "original"
     *
     * @param address address of the function to replace
     * @param replacement pointer to the replacement function
     * @param original pointer to the original function. Useful for calling the original behavior.
     */
    void syReplaceFunc(const u32 address, const void* replacement, void** original);
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
    void syReplaceFuncRel(const u32 offset, const void* replacement, void** original, int moduleId);

    int syLoadPlugins(const char* folder);

    typedef void (*ModuleLoadCB)(gfModuleInfo*);

    /**
     * @brief Event for when modules are loaded.
     */
    namespace ModuleLoadEvent {
        void Subscribe(ModuleLoadCB cb);
    }
}