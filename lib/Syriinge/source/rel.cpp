#include <OS/OSError.h>
#include <fa/fa.h>
#include <gf/gf_heap_manager.h>
#include <gf/gf_module.h>
#include <net/net.h>
#include <printf.h>

#include "sy_core.h"

namespace Syringe {

    extern "C" {
    typedef void (*PFN_voidfunc)();
    __attribute__((section(".ctors"))) extern PFN_voidfunc _ctors[];
    __attribute__((section(".ctors"))) extern PFN_voidfunc _dtors[];

    void _prolog();
    void _epilog();
    void _unresolved();
    }

    void InitNetwork()
    {
        SOInitInfo info = {
            SOAlloc,
            SOFree
        };
        SOInit(&info);
        SOStartupEx(0x2bf20);
    }

    void _prolog()
    {
        OSReport("[Syringe] Initializing. (ver. %s)\n", SYRINGE_VERSION);

        // Run global constructors
        PFN_voidfunc* ctor;
        for (ctor = _ctors; *ctor; ctor++)
        {
            (*ctor)();
        }

        // initialize core systems
        SyringeCore::syInit();

        // Initialize the socket systems
        // THIS SLOWS DOWN CONSOLE BOOT BY 40 SECONDS
        // InitNetwork();

        OSReport("[Syringe] Loading Plugins\n");

        int num = SyringeCore::syLoadPlugins("plugins");

        OSReport("[Syringe] Done. (plugins: %d)\n", num);

        // try and apply rel hooks to modules which
        // were already loaded before loading plugins
        // SyringeCore::applyRelHooks();
    }

    void _epilog()
    {
        // run the global destructors
        PFN_voidfunc* dtor;
        for (dtor = _dtors; *dtor; dtor++)
        {
            (*dtor)();
        }
    }

    void _unresolved(void)
    {
    }

}