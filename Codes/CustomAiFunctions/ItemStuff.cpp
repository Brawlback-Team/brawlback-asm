// 0x37 = item is smash ball
INJECTION("FORCE_NO_ITEM_LIMIT", 0x80962230, R"(
    li r21, 0
    subf r0,r3,r21
)")

INJECTION("FORCE_ITEM_OK_P1", 0x80962250, R"(
    li r3,2
    cmpwi r3,0x0
)")

// 0x809622d8; li r21, x = what item is spawned
INJECTION("FORCE_ITEM_SPAWN", 0x8096233c, R"(
    li r10,0x0
    SAVE_REGS
    bl forceItemKind
    RESTORE_REGS
    bl outputAiItemKind
    li r9, 0
    ori r9, r9, 0xffff
)")

INJECTION("weapon_everything", 0x809abc08, R"(
    li r3, 0x1
)")

// INJECTION("force_load_pokemon", 0x809aff90, R"(
//     li r4, 0x6F
//     li r6, 0x1
// )")

// INJECTION("force_item", 0x8098d524, R"(
//     li r6, 0x6F
// )")

// INJECTION("force_item_variation", 0x8077f780, R"(
//     SAVE_REGS
//     bl forceItemVariation
//     stw r3, 0x38(r30)
//     RESTORE_REGS
// )")

INJECTION("force_item_spawn_action", 0x8098f864, R"(
    mr r3, r26
    lwz r4, 0x8c0(r26)
    bl forceItemSpawnAction
    mr r4, r3
    addi r3, r26, 0x2c34
)")

// 0 = ignore
// 1 = ???
// 2 = ignore?
INJECTION("force_enum_val", 0x80922638, "li r19, 0x1")
INJECTION("force_item_detection", 0x8092263c, "li r20, 29")
INJECTION("FORCE_AI_ITEM_KIND", 0x80924b30, R"(
    lbz r0,0xa(r3)
    li r3, 60
    blr
)")

INJECTION("force_item_pass1", 0x80922c48, "nop")
INJECTION("force_item_pass2", 0x80922c4C, "nop")
INJECTION("force_item_detection2", 0x80923d94, R"(
    li r6, 0x14
    li r7, 0x10
    psq_l f0, 0x0(r5), 0x0, 0
)")
INJECTION("force_item_detection3", 0x80922abc, "li r24, 0x1")
INJECTION("force_enum_val_ud2", 0x80922f78, R"(
    li r22, 0x4
    li r23, 0x8
)")

// INJECTION("prevent_kirby_resources", 0x8082a0ac, "blr")
// // crash fix - looks janky, but *works*
// INJECTION("prevet_kirby_resources2", 0x8077ea28, "li r3, 0x0")
// INJECTION("prevent_pokemon_loading", 0x809afcd8, "blr")
// INJECTION("prevent_assist_loading", 0x809afa0c, "blr")

enum itemIdName {
    Assist_Trophy = 0x00,
    Franklin_Badge = 0x01,
    Banana_Peel = 0x02,
    Barrel = 0x03,
    Beam_Sword = 0x04,
    Bill_Coin_mode = 0x05,
    Bob_Omb = 0x06,
    Crate = 0x07,
    Bumper = 0x08,
    Capsule = 0x09,
    Rolling_Crate = 0x0A,
    CD = 0x0B,
    Gooey_Bomb = 0x0C,
    Cracker_Launcher = 0x0D,
    Cracker_Launcher_Shot = 0x0E,
    Coin = 0x0F,
    Superspicy_Curry = 0x10,
    Superspice_Curry_Shot = 0x11,
    Deku_Nut = 0x12,
    Mr_Saturn = 0x13,
    Dragoon_Part = 0x14,
    Dragoon_Set = 0x15,
    Dragoon_Sight = 0x16,
    Trophy = 0x17,
    Fire_Flower = 0x18,
    Fire_Flower_Shot = 0x19,
    Freezie = 0x1A,
    Golden_Hammer = 0x1B,
    Green_Shell = 0x1C,
    Hammer = 0x1D,
    Hammer_Head = 0x1E,
    Fan = 0x1F,
    Heart_Container = 0x20,
    Homerun_Bat = 0x21,
    Party_Ball = 0x22,
    Manaphy_Heart = 0x23,
    Maxim_Tomato = 0x24,
    Poison_Mushroom = 0x25,
    Super_Mushroom = 0x26,
    Metal_Box = 0x27,
    Hothead = 0x28,
    Pitfall = 0x29,
    Pokeball = 0x2A,
    Blast_Box = 0x2B,
    Ray_Gun = 0x2C,
    Ray_Gun_Shot = 0x2D,
    Lipstick = 0x2E,
    Lipstick_Flower = 0x2F,
    Lipstick_Shot_Dust_Powder = 0x30,
    Sandbag = 0x31,
    Screw_Attack = 0x32,
    Sticker = 0x33,
    Motion_Sensor_Bomb = 0x34,
    Timer = 0x35,
    Smart_Bomb = 0x36,
    Smash_Ball = 0x37,
    Smoke_Screen = 0x38,
    Spring = 0x39,
    Star_Rod = 0x3A,
    Star_Rod_Shot = 0x3B,
    Soccer_Ball = 0x3C,
    Super_Scope = 0x3D,
    Super_Scope_shot = 0x3E,
    Star = 0x3F,
    Food = 0x40,
    Team_Healer = 0x41,
    Lightning = 0x42,
    Unira = 0x43,
    Bunny_Hood = 0x44,
    Warpstar = 0x45,
    Trophy_SSE = 0x46,
    Key = 0x47,
    Trophy_Stand = 0x48,
    Stock_Ball = 0x49,
    Apple_Green_Greens = 0x4A,
    Sidestepper = 0x4B,
    Shellcreeper = 0x4C,
    Pellet = 0x4D,
    Vegetable_Summit = 0x4E,
    Sandbag_HRC = 0x4F,
    Auroros = 0x50,
    Koopa1 = 0x51,
    Koopa2 = 0x52,
    Snakes_Box = 0x53,
    Diddys_Peanut = 0x54,
    Links_Bomb = 0x55,
    Peachs_Turnup = 0x56,
    ROBs_Gyro = 0x57,
    Seed_edible_peanut = 0x58,
    Snakes_Grenade = 0x59,
    Samus_Armor_piece = 0x5A,
    Toon_Links_Bomb = 0x5B,
    Warios_Bike = 0x5C,
    Warios_Bike_A = 0x5D,
    Warios_Bike_B = 0x5E,
    Warios_Bike_C = 0x5F,
    Warios_Bike_D = 0x60,
    Warios_Bike_E = 0x61,
    Torchic = 0x62,
    Cerebi = 0x63,
    Chickorita = 0x64,
    Chickoritas_Shot = 0x65,
    Entei = 0x66,
    Moltres = 0x67,
    Munchlax = 0x68,
    Deoxys = 0x69,
    Groudon = 0x6A,
    Gulpin = 0x6B,
    Staryu = 0x6C,
    Staryus_Shot = 0x6D,
    Ho_oh = 0x6E,
    Ho_ohs_Shot = 0x6F,
    Jirachi = 0x70,
    Snorlax = 0x71,
    Bellossom = 0x72,
    Kyogre = 0x73,
    Kyogres_Shot = 0x74,
    Latias_and_Latios = 0x75,
    Lugia = 0x76,
    Lugias_Shot = 0x77,
    Manaphy = 0x78,
    Weavile = 0x79,
    Electrode = 0x7A,
    Metagross = 0x7B,
    Mew = 0x7C,
    Meowth = 0x7D,
    Meowths_Shot = 0x7E,
    Piplup = 0x7F,
    Togepi = 0x80,
    Goldeen = 0x81,
    Gardevoir = 0x82,
    Wobuffet = 0x83,
    Suicune = 0x84,
    Bonsly = 0x85,
    Andross = 0x86,
    Andross_Shot = 0x87,
    Barbara = 0x88,
    Gray_Fox = 0x89,
    Ray_MKII_Custom_Robo = 0x8A,
    Ray_MKII_Bomb = 0x8B,
    Ray_MKII_Gun_Shot = 0x8C,
    Samurai_Goroh = 0x8D,
    Devil = 0x8E,
    Excitebike = 0x8F,
    Jeff_Andonuts = 0x90,
    Jeff_Pencil_Bullet = 0x91,
    Jeff_Pencil_Rocket = 0x92,
    Lakitu = 0x93,
    Knuckle_Joe = 0x94,
    Knuckle_Joe_Shot = 0x95,
    Hammer_Bro = 0x96,
    Hammer_Bro_Hammer = 0x97,
    Helirin = 0x98,
    Kat_and_Ana = 0x99,
    Ana = 0x9A,
    Jill_and_Drill_Dozer = 0x9B,
    Lyn = 0x9C,
    Little_Mac = 0x9D,
    Metroid = 0x9E,
    Nintendog = 0x9F,
    NintendogFull = 0xA0,
    Mr_Resetti = 0xA1,
    Isaac = 0xA2,
    Isaac_Shot = 0xA3,
    Saki_Amamiya = 0xA4,
    Saki_Shot_1 = 0xA5,
    Saki_Shot_2 = 0xA6,
    Shadow_the_Hedgehog = 0xA7,
    Infantry = 0xA8,
    Infantry_Shot = 0xA9,
    Stafy = 0xAA,
    Tank_Infantry = 0xAB,
    Tank_Shot = 0xAC,
    Tingle = 0xAD,
    togezo = 0xAE,
    Waluigi = 0xAF,
    Dr_Wright = 0xB0,
    Wright_Buildings = 0xB1,
    Unknown1 = 0x7D1,
    Unknown2 = 0x7D2,
    Unknown3 = 0x7D3,
    Unknown4 = 0x7D4,
    Unknown5 = 0x7D5
};

extern "C" {
    void notifWeaponItem() { OSReport("Weapon Item\n"); };
    int item_kind = 0;
    void forceItemKind() {
        item_kind = 0;
        if (md_customFnInjectionToggle[0xD]) {
            item_kind = (int) md_customFnInjection[0xD]; 
        }
    };
    int forceItemSpawnAction(StageObject* obj, itemIdName itemId) {
        soMotionModule* motionMod = obj->modules->motionModule;
        int subaction = 0;
        if (md_customFnInjectionToggle[0xE]) {
            if (md_customFnInjectionToggle[0xF]) {
                subaction = (int) md_customFnInjectionToggle[0xF];
                motionMod->changeMotionRequest(&subaction);
            }
            return (int) md_customFnInjection[0xE];
        }
        switch(itemId) {
            case itemIdName::Soccer_Ball:
                subaction = 0x3;
                motionMod->changeMotionRequest(&subaction);
                return 5;
        }
        return 0x1;
    };
    void outputAiItemKind() {
        asm(R"(
            add r4, r4, %0
        )"
        :
        : "r" (item_kind));
    };
}