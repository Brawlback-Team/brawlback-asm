#include <stddef.h>
#include <StaticAssert.h>
#include <ExiStructures.h>
#include <gf/gf_pad_status.h>
FrameData::FrameData()
{
    randomSeed = 0;
    for(int i = 0; i < MAX_NUM_PLAYERS; i++)
    {
        playerFrameDatas[i] = PlayerFrameData();
    }
}
FrameData::FrameData(const FrameData& D)
{
    randomSeed = D.randomSeed;
    for(int i = 0; i < MAX_NUM_PLAYERS; i++)
    {
        playerFrameDatas[i] = D.playerFrameDatas[i]; 
    }
}
FrameData& FrameData::operator=(const FrameData &D ) {
    if( this != &D ) { 
        randomSeed = D.randomSeed;
        for(int i = 0; i < MAX_NUM_PLAYERS; i++)
        {
            playerFrameDatas[i] = D.playerFrameDatas[i]; 
        }
    }
    return *this;
}

PlayerFrameData::PlayerFrameData()
{
    randomSeed = 0;
    frame = 0;
    playerIdx = 0;
    pad = BrawlbackPad();
    sysPad = BrawlbackPad();
    syncData = SyncData();
}
PlayerFrameData::PlayerFrameData(const PlayerFrameData &D)
{
    randomSeed = D.randomSeed;
    frame = D.frame;
    pad = D.pad;
    sysPad = D.sysPad;
    syncData = D.syncData;
    playerIdx = D.playerIdx;
}
PlayerFrameData& PlayerFrameData::operator=(const PlayerFrameData &D ) { 
    if( this != &D ) {
        randomSeed = D.randomSeed;
        frame = D.frame;
        pad = D.pad;
        sysPad = D.sysPad;
        syncData = D.syncData;
        playerIdx = D.playerIdx;
    }
    return *this;
}

BrawlbackPad::BrawlbackPad()
{
    _buttons = 0;
    buttons = 0;
    holdButtons = 0;
    rapidFireButtons = 0;
    releasedButtons = 0;
    newPressedButtons = 0;
    LAnalogue = 0;
    RAnalogue = 0;
    stickX = 0;
    stickY = 0;
    cStickX = 0;
    cStickY = 0;
}
BrawlbackPad& BrawlbackPad::operator=(const BrawlbackPad &D ) { 
    if( this != &D ) {
        _buttons = D._buttons;
        buttons = D.buttons;
        holdButtons = D.holdButtons;
        rapidFireButtons = D.rapidFireButtons;
        releasedButtons = D.releasedButtons;
        newPressedButtons = D.newPressedButtons;
        LAnalogue = D.LAnalogue;
        RAnalogue = D.RAnalogue;
        stickX = D.stickX;
        stickY = D.stickY;
        cStickX = D.cStickX;
        cStickY = D.cStickY;
    }
    return *this;
}
BrawlbackPad::BrawlbackPad(const BrawlbackPad& D)
{
    _buttons = D._buttons;
    buttons = D.buttons;
    holdButtons = D.holdButtons;
    rapidFireButtons = D.rapidFireButtons;
    releasedButtons = D.releasedButtons;
    newPressedButtons = D.newPressedButtons;
    LAnalogue = D.LAnalogue;
    RAnalogue = D.RAnalogue;
    stickX = D.stickX;
    stickY = D.stickY;
    cStickX = D.cStickX;
    cStickY = D.cStickY;
}

SyncData::SyncData()
{
    percent = 0.0;
    locX = 0.0;
    locY = 0.0;
    anim = 0;
    stocks = 0;
    facingDir = 0;
}
SyncData::SyncData(const SyncData &D )
{
    percent = D.percent;
    locX = D.locX;
    locY = D.locY;
    anim = D.anim;
    stocks = D.stocks;
    facingDir = D.facingDir;
}
SyncData& SyncData::operator=(const SyncData &D ) {
    if( this != &D ) {
        percent = D.percent;
        locX = D.locX;
        locY = D.locY;
        anim = D.anim;
        stocks = D.stocks;
        facingDir = D.facingDir;
    }
    return *this;
}

SavestateMemRegionInfo::SavestateMemRegionInfo() 
{
    for(int i = 0; i < MAX_HEAPNAME_SIZE; i++)
    {
        nameBuffer[i] = 0;
    }
    nameSize = 0;
    address = 0;
    size = 0;
}
SavestateMemRegionInfo::SavestateMemRegionInfo(const SavestateMemRegionInfo &D )
{
    for(int i = 0; i < MAX_HEAPNAME_SIZE; i++)
    {
        nameBuffer[i] = D.nameBuffer[i];
    }
    nameSize = D.nameSize;
    address = D.address;
    size = D.size;
}
SavestateMemRegionInfo& SavestateMemRegionInfo::operator=(const SavestateMemRegionInfo &D ) {
    if( this != &D ) {
        for(int i = 0; i < MAX_HEAPNAME_SIZE; i++)
        {
            nameBuffer[i] = D.nameBuffer[i];
        }
        nameSize = D.nameSize;
        address = D.address;
        size = D.size;
    }
    return *this;
}

PreserveBlock::PreserveBlock()
{
    address = 0;
    length = 0;
}
PreserveBlock::PreserveBlock(const PreserveBlock &D)
{
    address = D.address;
    length = D.length;
}
PreserveBlock& PreserveBlock::operator=(const PreserveBlock &D ) {
    if( this != &D ) {
        address = D.address;
        length = D.length;
    }
    return *this;
}

PlayerSettings::PlayerSettings() {}
PlayerSettings::PlayerSettings(const PlayerSettings &D)
{
    charID = D.charID;
    charColor = D.charColor;
    playerType = D.playerType;
    controllerPort = D.controllerPort;
    for(int i = 0; i < NAMETAG_SIZE; i++)
    {
        nametag[i] = D.nametag[i];
    }
    for(int i = 0; i < DISPLAY_NAME_SIZE; i++)
    {
        displayName[i] = D.displayName[i];
    }
    for(int i = 0; i < CONNECT_CODE_SIZE; i++)
    {
        connectCode[i] = D.connectCode[i];
    }
}
PlayerSettings& PlayerSettings::operator=(const PlayerSettings &D ) {
    if( this != &D ) {
        charID = D.charID;
        charColor = D.charColor;
        playerType = D.playerType;
        controllerPort = D.controllerPort;
        for(int i = 0; i < NAMETAG_SIZE; i++)
        {
            nametag[i] = D.nametag[i];
        }
        for(int i = 0; i < DISPLAY_NAME_SIZE; i++)
        {
            displayName[i] = D.displayName[i];
        }
        for(int i = 0; i < CONNECT_CODE_SIZE; i++)
        {
            connectCode[i] = D.connectCode[i];
        }
    }
    return *this;
}
GameSettings::GameSettings() 
{
    for(int i = 0; i < MAX_NUM_PLAYERS; i++)
    {
        playerSettings[i] = PlayerSettings();
    }
}
GameSettings::GameSettings(const GameSettings &D)
{
    localPlayerIdx = D.localPlayerIdx;
    localPlayerPort = D.localPlayerPort;
    numPlayers = D.numPlayers;
    stageID = D.stageID;
    randomSeed = D.randomSeed;
    for(int i = 0; i < MAX_NUM_PLAYERS; i++)
    {
        playerSettings[i] = PlayerSettings(D.playerSettings[i]);
    }
}
GameSettings& GameSettings::operator=(const GameSettings &D ) { 
    if( this != &D ) {
        localPlayerIdx = D.localPlayerIdx;
        localPlayerPort = D.localPlayerPort;
        numPlayers = D.numPlayers;
        stageID = D.stageID;
        randomSeed = D.randomSeed;
        for(int i = 0; i < MAX_NUM_PLAYERS; i++)
        {
            playerSettings[i] = PlayerSettings(D.playerSettings[i]);
        }
    }
    return *this;
}

gfPadStatus::gfPadStatus() {
    _buttons = 0;
    buttons = 0;
    holdButtons = 0;
    rapidFireButtons = 0;
    releasedButtons = 0;
    newPressedButtons = 0;
    stickX = 0;
    stickY = 0;
    cStickX = 0;
    cStickY = 0;
    LAnalogue = 0;
    RAnalogue = 0;
    isNotConnected = 0;
    type = controllerType::GAMECUBE;
}
gfPadStatus::gfPadStatus(const gfPadStatus& D) {
    _buttons = D._buttons;
    buttons = D.buttons;
    holdButtons = D.holdButtons;
    rapidFireButtons = D.rapidFireButtons;
    releasedButtons = D.releasedButtons;
    newPressedButtons = D.newPressedButtons;
    stickX = D.stickX;
    stickY = D.stickY;
    cStickX = D.cStickX;
    cStickY = D.cStickY;
    LAnalogue = D.LAnalogue;
    RAnalogue = D.RAnalogue;
    isNotConnected = D.isNotConnected;
    type = D.type;
}
gfPadStatus& gfPadStatus::operator=(const gfPadStatus &D ) {
    if( this != &D ) {
        _buttons = D._buttons;
        buttons = D.buttons;
        holdButtons = D.holdButtons;
        rapidFireButtons = D.rapidFireButtons;
        releasedButtons = D.releasedButtons;
        newPressedButtons = D.newPressedButtons;
        stickX = D.stickX;
        stickY = D.stickY;
        cStickX = D.cStickX;
        cStickY = D.cStickY;
        LAnalogue = D.LAnalogue;
        RAnalogue = D.RAnalogue;
        isNotConnected = D.isNotConnected;
        type = D.type;
    }
    return *this;
}