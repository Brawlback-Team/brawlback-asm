//
// Created by Ilir on 2021-12-13.
//

#include "CrowdControl.h"
#include "EXIPacket.h"
#include "EffectItemHandler.h"

namespace FrameLogic {

    // called when game starts
    void SendGameStatus(EXIStatus exiStatus) {
        EXIPacket responsePckt = EXIPacket(exiStatus, nullptr, 0);
        responsePckt.Send();
    }

    // called at the beginning of the logic in a frame
    void BeginFrame() {

        // halfword vector for sending into to the game
        // first entry is effect id (EFFECT_NOT_CONNECTED = 0, EFFECT_NONE = 1, EFFECT_UNKNOWN = 2, EFFECT_ACTUAL >= 3
        // second and above entries are parameters for the effect
        EXIPacket requestPckt = EXIPacket(5*sizeof(u16));
        requestPckt.Receive();
        u16* effectRequest = (u16*)requestPckt.source;

        EXIStatus exiStatus = STATUS_UNKNOWN;

        switch(effectRequest[0]){
            case EFFECT_SPAWN_ITEM_REGULAR:
                exiStatus = effectItemSpawn(effectRequest[1], effectRequest[2]);
                break;
            case EFFECT_NOT_CONNECTED:
            case EFFECT_NONE:
            case EFFECT_UNKNOWN:
                break;
            default:
                exiStatus = RESULT_EFFECT_FAILURE;
                break;
        }

        if (exiStatus >= 5) {
            EXIPacket responsePckt = EXIPacket(exiStatus, nullptr, 0);
            responsePckt.Send();
        }
    }

    // called at the end of the game logic in a frame
    //void EndFrame() {

    //}

    SIMPLE_INJECTION(startGame, 0x806dd5f4, "mr r3, r19") { SendGameStatus(EXIStatus::STATUS_GAME_STARTED); } // when booting up
    SIMPLE_INJECTION(startMatch, 0x800dc590, "li r9, 0x2") { SendGameStatus(EXIStatus::STATUS_MATCH_STARTED); } // when starting match
    SIMPLE_INJECTION(endMatch, 0x806d4844, "li r4, 0") { SendGameStatus(EXIStatus::STATUS_MATCH_ENDED); } // when exiting match
    SIMPLE_INJECTION(beginFrame, 0x80147394, "li r0, 0x1") { BeginFrame(); }
    //SIMPLE_INJECTION(endFrame,   0x801473a0, "li r0, 0x0") { EndFrame(); }
}