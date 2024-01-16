#include "Brawlback.h"

/*
INJECTION("cameraRollbackBypass3", 0x8009fee4, R"(
    rlwinm. r0, r0, 0x1c, 0x1f, 0x1f
    bl cameraFFBypass
)");
extern "C" void cameraFFBypass() {
    if (FrameAdvance::getFramesToAdvance() > 1) {
        // if we are fast forwarding, skip camera update
        // forces branch at 8009fee8
        asm(R"(
            li r0, 0x0
            cmpwi r0, 0x0
        )");
    }
}
*/



// ~~~~~~~~~ RUMBLE ~~~~~~~~~~~~~~~

// updateGame/[gfPadSystem]
INJECTION("PadRumbleInterpretNop", 0x8002a520, "nop");


// removeRumbleMask/[IpHuman]
INJECTION("PadRumbleRemoveMaskNop", 0x80048500, "nop");

// frameStartInit/[gfApplication]
INJECTION("PadRumbleActivateAllNop", 0x800175b4, "nop");

// removeRumbleId/[IpHuman]
INJECTION("PadRumbleRemoveIDNop", 0x800484cc, "nop");

// setRumble/[IpHuman]
INJECTION("lbSetRumbleNop", 0x80048430, "nop");