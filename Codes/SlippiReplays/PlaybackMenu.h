#ifndef PROJECTMCODES_PLAYBACKMENU_H
#define PROJECTMCODES_PLAYBACKMENU_H
#include "Assembly.h"
#include "Debug.h"
#include "Wii/EXI/EXI.h"
#include "Memory.h"
#include "Wii/PAD/PADStatus.h"
#include "Brawl/GF/GameFrame.h"
#include "Brawl/GF/gfApplication.h"
#include <Brawl/FT/ftManager.h>
#include <Brawl/GF/GameGlobal.h>
#include <Wii/mtRand.h>
#include <Brawl/IT/itManager.h>
#include "EXIPacket.h"
#include "Containers/vector.h"
#include "Wii/OS/OSInterrupt.h"
#include "Replays.h"
#include "menu.h"
#include "Brawl/sndSystem.h"
#include "Graphics/Drawable.h"
#include <string>

namespace replayMenus {
    class ReplayOption : public StandardOption {
    public:
        ReplayOption(char* name);
        void modify(float) {}
        void select();
        void deselect() {}
        void render(TextPrinter* printer, char* buffer);

        virtual ~ReplayOption() {}
    private:
        unsigned int id;
    };
    struct ReplaysMenu : public Page {
        ReplaysMenu(Menu *myMenu);
    };
}

#endif //PROJECTMCODES_PLAYBACKMENU_H
