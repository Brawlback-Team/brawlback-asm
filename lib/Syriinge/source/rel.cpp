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
        SOInitInfo info;
        info.allocator = SOAlloc;
        info.dealloc = SOFree;
        SOInit(&info);
        SOStartupEx(0x2bf20);
    }

    gfModule* loadModule(const char* path, HeapType heap)
    {
        gfFileIOHandle handle;
        handle.read(path, Heaps::MenuInstance, 0);
        void* buffer = handle.getBuffer();
        void* heapAddr = gfHeapManager::getHeap(heap);
        size_t size = handle.getSize();

        gfModule* module = gfModule::create(heapAddr, buffer, size);

        // call prolog function
        ((void (*)())module->header->prologOffset)();

        free(buffer);
        handle.release();

        return module;
    }

    void loadPlugins()
    {
        FAEntryInfo info;
        char tmp[0x80];
        sprintf(tmp, "%spf/plugins/*.rel", MOD_PATCH_DIR);
        if (FAFsfirst(tmp, 0x20, &info) == 0)
        {
            if (info.name[0] == 0)
                sprintf(tmp, "plugins/%s", info.shortname);
            else
                sprintf(tmp, "plugins/%s", info.name);

            loadModule(tmp, Heaps::Syringe);

            while (FAFsnext(&info) == 0)
            {
                if (info.name[0] == 0)
                    sprintf(tmp, "plugins/%s", info.shortname);
                else
                    sprintf(tmp, "plugins/%s", info.name);

                loadModule(tmp, Heaps::Syringe);
            }
        }
    }

    void _prolog()
    {
        // Run global constructors
        PFN_voidfunc* ctor;
        for (ctor = _ctors; *ctor; ctor++)
        {
            (*ctor)();
        }

        // initialize core systems
        SyringeCore::syInit();

        // Initialize the socket systems
        InitNetwork();

        loadPlugins();
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