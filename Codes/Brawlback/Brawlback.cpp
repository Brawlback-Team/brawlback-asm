#include "Brawlback.h"
#include "CLibs/cstring.h"
#include "Brawl/GF/gfPadSystem.h"
#include "EXIPacket.h"


namespace FrameAdvance {

    int framesToAdvance = 1;

    // og instruction: cmplw r19, r24
    // # of frames to simulate is stored in r24

    // keep in mind that overriding this means that brawl's native
    // catchup system where it fast forwards a few frames when it lags is no longer active
    INJECTION("handleFrameAdvance", 0x800173a4, R"(
        bl handleFrameAdvance
        cmplw r19, r24
    )");
    extern "C" void handleFrameAdvance() {
        asm("mr r24, %0"
            :
            : "r" (framesToAdvance)
        );
    }

}


namespace FrameLogic {

    // called at the beginning of the game logic in a frame
    // a this point, inputs are populated for this frame
    void BeginFrame() {
        
        gfPadSystem* padSystem = PAD_SYSTEM;
        bool is_b_press = padSystem->pads[0].buttons.B;
        //FrameAdvance::framesToAdvance = is_b_press ? 15 : 1;

        /*
        if (is_b_press) {
            void* inputs = &padSystem->pads[0];
            u32 inputs_size = sizeof(gfPadGamecube);
            OSReport("Inputs size: %u\n", inputs_size);
            OSReport("Is B Held (from game): %u\n", padSystem->pads[0].buttons.B);
            EXIPacket inputPckt = EXIPacket(EXICommand::CMD_ONLINE_INPUTS, inputs, inputs_size);
            inputPckt.Send();
        }
        */
        
        if (padSystem->pads[0].buttons.R) { // save state
            EXIPacket saveSavePckt = EXIPacket(EXICommand::CMD_CAPTURE_SAVESTATE, nullptr, 0);
            saveSavePckt.Send();
        }

        if (padSystem->pads[0].buttons.L) { // load state
            EXIPacket LoadSaveStatePckt = EXIPacket(EXICommand::CMD_LOAD_SAVESTATE, nullptr, 0);
            LoadSaveStatePckt.Send();
        }
    }

    // called at the end of the game logic in a frame (rendering logic happens after this func in the frame)
    // at this point, I think its (maybe?) guarenteed that inputs are cleared out already
    void EndFrame() {

    }

    SIMPLE_INJECTION(beginFrame, 0x80147394, "li r0, 0x1") { BeginFrame(); }
    SIMPLE_INJECTION(endFrame,   0x801473a0, "li r0, 0x0") { EndFrame(); }
}