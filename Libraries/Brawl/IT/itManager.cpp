
#include "itManager.h"

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)
BaseItem* itManager::getItemFromIndex(u32 index) {
    OSReport("here 1.1\n");
    OSReport("itMan addr: %08x\n", this);
    return _getItemFromIndex_itManager(this, index);
}

BaseItem* itManager::createItem(itemIdName itemID, u32 variantID) {
    return _createItem_itManager(this, itemID, variantID, 0xFFFFFFFF, 0, 0, 0xFFFF, 0, 0xFFFF);
}

void itManager::preloadAssist(itemIdName itemID) {
    _preloadAssist_itManager(this, itemID);
}

void itManager::preloadItemKindArchive(itemIdName id) {
    _preloadItemKindArchive_itManager(this, id, 0x1388, 0x1, 0x1);
}

// explodey bob-ombs
// p0 (this; r3): 8062b360
// p1: 3ff0000000000000 (double; 1)
// p3: 805b4e60
// p4: 805b4e60
// p5: 00000006
// p6: 00000001
// p7: ffffffff
// p8: ffffffff
// p9: 00000000
// p10 (st[0xb]): 00
// p11 (st[0xc]): 0000FFFF
// p12 (st[0x10]): 00000000
// p13 (st[0x14]): 0000FFFF
// p14 (st[0x18]): 00000014

// MY bob-ombs:
// p0 (this; r3): 8062b360
// p1: 3ff0000000000000 (double; 1)
// p3: 805b4a78
// p4: 805b4a78
// p5: 00000006
// p6: 00000001
// p7: ffffffff
// p8: ffffffff
// p9: 00000000
// p10 (st[0xb]): 00
// p11 (st[0xc]): 0000FFFF
// p12 (st[0x10]): 00000000
// p13 (st[0x14]): 0000FFFF
// p14 (st[0x18]): 00000014