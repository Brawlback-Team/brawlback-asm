#include "Assembly.h"
#include "Brawl/GF/gfApplication.h"

namespace ReplaysLogic {
    bool isGamePaused() {
        return (GF_APPLICATION->_gameFlags & 0x01000000) != 0;
    }


}