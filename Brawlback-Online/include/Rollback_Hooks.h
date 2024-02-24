#pragma once
#include <types.h>
#include <OS/OSInterrupt.h>
#include <OS/OSError.h>
#include <gf/gf_frame.h>
#include <gf/gf_task.h>
#include <gf/gf_pad_system.h>
//#include <ft/ft_manager.h>
#include <gm/gm_global.h>
#include <gm/gm_global_mode_melee.h>
#include <gf/gf_game_application.h>
#include <gf/gf_scene.h>
#include <sc/sc_melee.h>
#include <mt/mt_rand.h>
#include "mu/mu_msg.h"
#include <OS/OSTime.h>
#include <ExiStructures.h>
#include <ip/controls.h>
//#include <ft/ft_manager.h>

#include "EXI_hooks.h"
#include "utils.h"
#include "exi_packet.h"

#include "ms/message.h"
#if 1
#define NETPLAY_IMPL
#define ROLLBACK_IMPL
#endif

bu32 getCurrentFrame();

void fillOutGameSettings(GameSettings& settings);
void MergeGameSettingsIntoGame(GameSettings& settings);
extern bool canRollback;
extern bu32 frameCounter;
extern bool shouldTrackAllocs;
extern bool doDumpList;
extern bool isRollback;

namespace FrameLogic {
    // Variables
    extern gfTask* task;
    extern bu32 task_type;
    extern PlayerFrameData playerFrame;
    extern gfPadStatus lastLocalInput;
    extern gfPadStatus inputBuffer;
    extern bool fixStaleInputs;
    extern bool shouldSkipTask;
    extern bu32 r3_value;
    // Functions
    void ReduceStickNoise();
    void FixStaleInputs();
    void WriteInputsForFrame();
    void FrameDataLogic();
    void SendFrameCounterPointerLoc();
    bool ShouldSkipGfTaskProcess(gfTask* task, bu32 task_type);

    // Hooks
    void initFrameCounter();
    void updateFrameCounter();
    void beginningOfMainGameLoop();
    void beginningOfFrameLoop();
    __attribute__((naked)) void beginningOfFrameLoop2();
    __attribute__((naked)) void isBreakGameProcLoopHook();
    void beginFrame();
    void endFrame();
    void endMainLoop();
    void gfTaskProcessHook();
    __attribute__((naked)) void gfTaskProcessHook2();
    void setFixStaleInputsTrue();
}
namespace FrameAdvance {
    // Variables
    extern bu32 framesToAdvance;
    extern FrameData currentFrameData;
    extern u32 shouldSkipPadAlarmInstr;
    extern bool checkPad;
    // Functions
    bu32 getFramesToAdvance();
    void TriggerFastForwardState(bu8 numFramesToFF);
    void StallOneFrame();
    void ResetFrameAdvance();
    void GetInputsForFrame(bu32 frame, FrameData* inputs);
    void ProcessGameSimulationFrame(FrameData* inputs);
    void setFrameAdvanceFromEmu();
    void getGamePadStatusInjection(gfPadStatus* status, int port, bool isGamePad);

    // Hooks
    void fixPadInconsistency();
    void updateLowHook();
    void handleFrameAdvanceHook();
    void turnOnAllAppropriatePorts();
    __attribute__((naked)) void moveUpdateSystem();
}

// TODO: put this in the submodule and pack it
struct GameReport {
    f64 damage[MAX_NUM_PLAYERS];
    s32 stocks[MAX_NUM_PLAYERS];
    s32 frame_duration;
};

namespace Util {
    void printInputs(const BrawlbackPad& pad);
    void printGameInputs(const gfPadStatus& pad);
    void printFrameData(const FrameData& fd);
    void SyncLog(const BrawlbackPad& pad, bu8 playerIdx);
    void FixFrameDataEndianness(FrameData* fd);
    BrawlbackPad GamePadToBrawlbackPad(const gfPadStatus& pad);
    void BrawlbackControlsToGameControls(const BrawlbackControls& brawlbackControls, Controls& controls);
    BrawlbackControls GameControlsToBrawlbackControls(const Controls& controls);
    void PopulatePlayerFrameData(PlayerFrameData& pfd, bu8 port, bu8 pIdx);
    void InjectBrawlbackPadToPadStatus(gfPadStatus* gamePad, const BrawlbackPad& pad, int port);
    void SaveState(bu32 currentFrame);
}
namespace Match {
    extern bu32 allocSizeTracker;
    extern char allocHeapName[30];
    extern gmSetRule rules;
    
    void PopulateGameReport(GameReport& report);
    void SendGameReport(GameReport& report);
    void StopGameScMeleeHook();
    void StartSceneMelee();
    void ExitSceneMelee();
    void setRandSeed();
    void dump_gfMemoryPool_hook();
    void DumpGfMemoryPoolHook(char** r30_reg_val, bu32 addr_start, bu32 addr_end, bu32 mem_size, u8 id);
    void ProcessGameAllocation(u8* allocated_addr, bu32 size, char* heap_name);
    void ProcessGameFree(u8* address, char* heap_name);
    void alloc_gfMemoryPool_hook();
    void AllocGfMemoryPoolBeginHook(char** internal_heap_data, bu32 size, bu32 alignment);
    void allocGfMemoryPoolEndHook();
    void free_gfMemoryPool_hook();
    void FreeGfMemoryPoolHook(char** internal_heap_data, u8* address);
}

namespace Netplay {
    // Variables
    extern GameSettings gameSettings;
    extern const bu8 localPlayerIdxInvalid;
    extern bu8 localPlayerIdx;
    extern bool isInMatch;
    extern bool foundMatch;
    extern bool isInTrainingRoom;
    // Functions
    static void* StartMatching(void*);
    bool CheckIsMatched();
    void EndMatch();

    bool IsInMatch();
    void SetIsInMatch(bool isMatch);

    int getLocalPlayerIdx();
    GameSettings& getGameSettings();
}

namespace NetMatchMakingStatus {
    const bu32 LinkDown = 0x0;
    const bu32 LinkUp = 0x1;
    const bu32 DWCReady = 0x2;
    const bu32 WaitLogin = 0x3;
    const bu32 Download = 0x4;
    const bu32 Online = 0x5;
    const bu32 MatchingStart = 0x6;
    const bu32 Matching = 0x7;
    const bu32 MatchingWaitShare = 0x8;
    const bu32 P2P = 0x9;
    const bu32 DisconnectAll = 0xa;
    const bu32 WaitShutdown = 0xb;
    const bu32 Error = 0xc;
}

namespace Scene {
    const bu32 None = 0x0;
    const bu32 MemoryChange = 0x1;
    const bu32 Idle = 0x2;
    const bu32 InitialChange = 0x3;
    const bu32 SelectCharacter = 0x4;
    const bu32 Unk5 = 0x5;
    const bu32 SelStage = 0x6;
    const bu32 Unk7 = 0x7;
    const bu32 Unk8 = 0x8;
    const bu32 Melee = 0x9;
    const bu32 Unk10 = 0xa;
    const bu32 Unk11 = 0xb;
    const bu32 VsResult = 0xc;
    const bu32 Unk13 = 0xd;
    const bu32 PrizeCheck = 0xe;
    const bu32 Unk15 =	0xf;
    const bu32 MenuMain = 0x10;
}

namespace NetMenu {
    // Variables
    extern bool skipToCSS;
    extern bool setRules;
    extern bool onQuickplayMenus;
    extern int register4;
    extern MuMsg* message;
    // Functions
    void ChangeGfSceneField(bu32 scene);
    void ChangeStruct3Scenes(bu8* structure, bu32 scene, bu32 nextScene);
    void ChangeStruct3Scenes(bu8* structure, bu32 scene);
    void BootToScMelee();
    void MatchmakingText();
    // Hooks
    __attribute__((naked)) void setToLoggedIn();
    __attribute__((naked)) void setToLoggedIn2();
    __attribute__((naked)) void disableMiiRender();
    __attribute__((naked)) void disableMatchmakingError();
    void connectToAnybodyAsyncHook();
    __attribute__((naked)) void connectToAnybodyAsyncHook2();
    __attribute__((naked)) void disableCreateCounterOnCSS();
    __attribute__((naked)) void turnOffCSSTimer();
    __attribute__((naked)) void disableCreateCounterOnSSS();
    __attribute__((naked)) void turnOffSSSTimer();
    __attribute__((naked)) void disableGetNetworkErrorOnCSS();
    __attribute__((naked)) void disableGetNetworkErrorOnSSS();
    __attribute__((naked)) void forceFriendCode();
    __attribute__((naked)) void forceConnection();
    void startMatchingCallback();
    void setNextAnyOkirakuTop();
    void setNextAnyOkirakuCaseFive();
    void netThreadTaskOverride();
    __attribute__((naked)) void BBisCompleteMeleeSettingAllMember();
    __attribute__((naked)) void BBisWifiPreloadCharacter();
    __attribute__((naked)) void BBisCompleteCloseMatchingAllNode();
    __attribute__((naked)) void BBisPlayerAssignReceived();
    __attribute__((naked)) void netThreadTaskOverride2();
    __attribute__((naked)) void startMatchingCallback2();
    __attribute__((naked)) void BBSkipgmInitGlobalMelee();
    __attribute__((naked)) void BBSkipgmInitGlobalMelee2();
    void RemoveDisconnectPanel();
    __attribute__((naked)) void RemoveDisconnectPanel2();
    void RemoveDisconnectPanel3();
    void BBsetNextAnyOriakuBootScMelee();
    __attribute__((naked)) void BBSkipRandomRulesetChange();
    void BBSetGameModeBitCorrectly();
    __attribute__((naked)) void BBSetGameModeBitCorrectly2();
    void BBSetupCharacters();
    void BBSetupNetMelee();
    __attribute__((naked)) void ExitWifiCSSReturnsToDirectOrQuickplayScreen();
    void ExitWifiCSSReturnsToDirectOrQuickplayScreen2();;
    void SkipDirectlyToCSS();
    void SkipDirectlyToTrainingRoom();
    void GetRulesFromCSSBoot();
    void SetRulesFromCSSBoot();
    void ReplaceTrainingRoomText();
}

namespace NetReport {
    // Variables

    // Functions
    void netReportHookFunc(char* str);

    // Hooks
    __attribute__((naked)) void netReportHook();
    __attribute__((naked)) void netReportHook2();
    __attribute__((naked)) void netReportHook3();
    __attribute__((naked)) void netReportHook4();
    __attribute__((naked)) void netMinReportHook();
}

extern u8 defaultGmGlobalModeMelee[0x320];
namespace GMMelee {
    // Variables
    extern bool isMatchChoicesPopulated;
    extern int charChoices[MAX_NUM_PLAYERS];
    extern int fileIndexChoices[MAX_NUM_PLAYERS];
    extern bool rumbleChoices[MAX_NUM_PLAYERS];
    extern int costumeChoices[MAX_NUM_PLAYERS];
    extern  BrawlbackControls controlsChoices[MAX_NUM_PLAYERS];
    extern int stageChoice;
    #define STAGE_ID_IDX 27

    // Functions
    void PopulateMatchSettings(int chars[4], int costumes[4], int fileIndices[4], bool rumble[4], BrawlbackControls controls[4], int stageID);
    void ResetMatchChoicesPopulated();

    // Hooks
    void postSetupMelee();
}

namespace RollbackHooks {
    void InstallHooks();
}