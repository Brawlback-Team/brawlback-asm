#include <OS/OSError.h>
#include <gf/gf_heap_manager.h>
#include <gf/gf_module.h>
#include <memory.h>

#include "plugin.h"
#include "string.h"

namespace Syringe {
    typedef PluginMeta* (*PluginPrologFN)(CoreApi*);
    Plugin::Plugin(const char* path)
    {
        strncpy(this->path, path, sizeof(this->path));
    }

    gfModule* Plugin::loadPlugin()
    {
        gfFileIOHandle handle;
        handle.read(this->path, Heaps::MenuInstance, 0);
        void* buffer = handle.getBuffer();
        void* heapAddr = gfHeapManager::getHeap(Heaps::Syringe);
        size_t size = handle.getSize();

        // Create the gfModule object
        this->module = gfModule::create(heapAddr, buffer, size);

        // Free the buffer and release the handle
        free(buffer);
        handle.release();

        // Normally module prolog doesn't return anything, but in our case we stipulate
        // that it returns a pointer to the plugin metadata struct and takes the API as an argument
        PluginPrologFN prolog = reinterpret_cast<PluginPrologFN>(this->module->header->prologOffset);
        this->metadata = prolog(SyringeCore::API);

        char buff[10];
        if (this->metadata->SY_VERSION != Version(SYRINGE_VERSION))
        {
            this->metadata->SY_VERSION.toString(this->metadata->SY_VERSION, buff);
            OSReport("[Syringe] Syringe version mismatch! (plugin: %s, core: %s)\n", buff, SYRINGE_VERSION);
        }

        this->metadata->VERSION.toString(this->metadata->VERSION, buff);
        OSReport("[Syringe] Loaded plugin (%s, v%s)\n", this->metadata->NAME, buff);

        this->enable = true;
        return module;
    }
    void Plugin::unloadPlugin()
    {
        // TECHNICALLY we should unlink first
        // but i don't see any issues?
        delete this->module;
        this->enable = false;
    }
}