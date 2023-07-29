#include "sy_core.h"
#include "sy_utils.h"
#include <OS/OSCache.h>
#include <gf/gf_module.h>
#include <vector.h>

namespace SyringeCore {
    /**
     * @brief Contains a list of pointers to Injections
     */
    Vector<InjectionAbs*> Injections;

    /**
     * @brief hook used to re-inject hooks after dynamically loaded modules are loaded
     * @note INTERNAL ONLY.
     */
    void onModuleLoaded()
    {
        register gfModuleInfo* info;

        asm {
            mr info, r30
        }

        gfModuleHeader* header = info->m_module->header;

        u32 textAddr = header->getTextSectionAddr();
        int numInjections = Injections.size();

        for (int i = 0; i < numInjections; i++)
        {
            InjectionAbs* inject = Injections[i];
            if (inject->moduleId != header->id)
            {
                continue;
            }

            u32 targetAddr = inject->tgtAddr;

            // if this is a module hook, add offset to .text addr
            if (targetAddr < 0x80000000)
            {
                targetAddr += textAddr;
            }

            if (inject->originalInstr == -1)
            {
                Hook* asHook = (Hook*)inject;

                // it's important we refresh this before
                // patching the target with the hook branch
                if (asHook->trampoline != NULL)
                {
                    asHook->trampoline->originalInstr = *(u32*)targetAddr;
                }

                u32 branchAddr = (u32)&asHook->branch;
                *(u32*)targetAddr = SyringeUtils::EncodeBranch(targetAddr, branchAddr);
            }
            else
            {
                // refresh original instruction now that
                // module has been loaded into memory
                inject->originalInstr = *(u32*)targetAddr;

                u32 hookAddr = (u32)&inject->originalInstr;
                *(u32*)targetAddr = SyringeUtils::EncodeBranch(targetAddr, hookAddr);
            }
            ICInvalidateRange((void*)targetAddr, 0x04);
        }
    }

    /**
     * @brief Initializes the Syringe core systems.
     * This function must be called before running any hooking operations.
     */
    void syInit()
    {
        // Reload hooks every time a module is loaded
        SyringeCore::syInlineHook(0x80026db4, reinterpret_cast<void*>(onModuleLoaded));
        SyringeCore::syInlineHook(0x800272e0, reinterpret_cast<void*>(onModuleLoaded));
    }

    /**
     * @brief Injects a hook at the target address.
     * @note Hooks injected via this function WILL automatically return execution to the original function.
     *
     * @param address address to inject our hook at
     * @param replacement pointer to the function to run
     * @param moduleId Optional. Only needed if this hook is inside a dynamically loaded module.
     */
    void syInlineHook(const u32 address, const void* replacement, int moduleId)
    {
        // set up our trampoline for calling original
        InlineHook* hook = new InlineHook();
        hook->originalInstr = *(u32*)address;
        hook->moduleId = moduleId;
        hook->tgtAddr = address;

        // no need to patch immediately if target is inside a rel
        if (moduleId == -1)
        {
            // patch target func with hook
            u32 hookAddr = (u32)&hook->originalInstr;
            *(u32*)address = SyringeUtils::EncodeBranch(address, hookAddr);
        }

        // encode hook with jump to our func
        u32 replAddr = reinterpret_cast<u32>(replacement);
        u32 replBranchAddr = (u32)&hook->instructions[4];
        hook->instructions[4] = SyringeUtils::EncodeBranch(replBranchAddr, replAddr, true);

        // encode hook with branch back to injection point
        u32 returnBranch = (u32)&hook->instructions[9];
        hook->instructions[9] = SyringeUtils::EncodeBranch(returnBranch, (address + 4));

        Injections.push(hook);

        ICInvalidateRange((void*)address, 0x04);
    }
    /**
     * @brief Injects an inline hook into a dynamically loaded module on load.
     * @note Hooks injected via this function WILL automatically return execution to the original function.
     *
     * @param offset offset inside the module's .text section to insert the hook
     * @param replacement pointer to the function to inject
     * @param moduleId ID of the target module
     */
    void syInlineHookRel(const u32 offset, const void* replacement, int moduleId)
    {
        syInlineHook(offset, replacement, moduleId);
    }
    /**
     * @brief Injects a simple hook at the target address.
     * @note Hooks injected through this function WILL NOT automatically branch back to the original after returning.
     *
     * @param address address to inject the hook at
     * @param replacement pointer to function the hook will point to
     * @param moduleId Optional. Only needed if this hook is inside a dynamically loaded module.
     */
    void sySimpleHook(const u32 address, const void* replacement, int moduleId)
    {
        syReplaceFunc(address, replacement, NULL, moduleId);
    }
    /**
     * @brief Injects a simple hook into a dynamically loaded module on load.
     * @note Hooks injected through this function WILL NOT automatically branch back to the original after returning.
     *
     * @param offset offset inside the module's .text section to insert the hook
     * @param replacement pointer to function the hook will point to
     * @param moduleId ID of the target module
     */
    void sySimpleHookRel(const u32 offset, const void* replacement, int moduleId)
    {
        sySimpleHook(offset, replacement, moduleId);
    }

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
    void syReplaceFunc(const u32 address, const void* replacement, void** original, int moduleId)
    {
        Hook* hook = new Hook();
        hook->moduleId = moduleId;
        hook->tgtAddr = address;

        if (original != NULL)
        {
            // encode our trampoline branch
            // back to original func
            Trampoline* tramp = new Trampoline();
            tramp->originalInstr = *(u32*)address;

            u32 trampBranch = (u32)&tramp->branch;
            tramp->branch = SyringeUtils::EncodeBranch(trampBranch, address + 4);

            *original = tramp;
            hook->trampoline = tramp;
        }

        u32 replAddr = reinterpret_cast<u32>(replacement);
        u32 hookBranch = (u32)&hook->branch;
        hook->branch = SyringeUtils::EncodeBranch(hookBranch, replAddr);

        // no need to patch immediately if target is inside a rel
        if (moduleId == -1)
        {
            // patch target func with hook
            *(u32*)address = SyringeUtils::EncodeBranch(address, hookBranch);
            ICInvalidateRange((void*)address, 0x04);
        }

        Injections.push(hook);
    }
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
    void syReplaceFuncRel(const u32 offset, const void* replacement, void** original, int moduleId)
    {
        syReplaceFunc(offset, replacement, original, moduleId);
    }

    /**
     * @brief Replaces the function at the target address with the function pointed to by "replacement".
     * @note Replacement functions will not automatically call or return to the original function.
     * To call the original function, use the parameter "original"
     *
     * @param symbol address of the function to replace
     * @param replacement pointer to the replacement function
     * @param original pointer to the original function. Useful for calling the original behavior.
     * @param moduleId Optional. Only needed if this hook is inside a dynamically loaded module.
     */
    void syReplaceFunc(const void* symbol, const void* replacement, void** original, int moduleId)
    {
        return syReplaceFunc((u32)symbol, replacement, original, moduleId);
    }

} // namespace SyringeCore
