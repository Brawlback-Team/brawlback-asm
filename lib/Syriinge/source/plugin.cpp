#include <OS/OSError.h>
#include <gf/gf_heap_manager.h>
#include <gf/gf_module.h>
#include <memory.h>

#include "plugin.h"
#include "string.h"

namespace Syringe {
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
        char buff[10];

        this->module = gfModule::create(heapAddr, buffer, size);

        // call prolog function
        this->metadata = ((PluginMeta * (*)()) this->module->header->prologOffset)();

        if (this->metadata->SY_VERSION != Version(SYRINGE_VERSION))
        {
            versionToString(this->metadata->SY_VERSION, buff);
            OSReport("[Syringe] Version Mismatch! (wanted: %s, installed: %s)", buff, SYRINGE_VERSION);
        }

        versionToString(this->metadata->VERSION, buff);
        OSReport("[Syringe] Loaded plugin (%s, v%s)\n", this->metadata->NAME, buff);

        free(buffer);
        handle.release();

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