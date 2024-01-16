
#include "AICEPac.h"

#define OSReport ((void (*)(const char* text, ...)) 0x801d8600)

char* AICEStringEntry::getStringEntry(int index) {
  auto thisINT = reinterpret_cast<unsigned int>(this);
  return (char*) (thisINT + (*(AICEStringEntryPair*)(thisINT + 0x10 + 0x8 * index)).offset);
}

AICEEntry* AICEPac::getCEEntry(int entryNumber) {
  auto thisINT = reinterpret_cast<unsigned int>(this);
  return &(*(AICEEntry*)(thisINT + *(unsigned int *)(thisINT + (0x10 + 0x4 * entryNumber))));
}

int AICEPac::getStringCount(int entryNumber) {
  auto thisINT = reinterpret_cast<unsigned int>(this);
  auto offset = *(unsigned int *)(thisINT + (0x10 + 0x4 * this->numEntries + 0x4 * entryNumber));
  if (offset == 0) return 0;
  AICEStringEntry* entry = &(*(AICEStringEntry*)(thisINT + offset));
  return entry->count;
}

char* AICEPac::getStringEntry(int entryNumber, int index) {
  auto thisINT = reinterpret_cast<unsigned int>(this);
  auto offset = *(unsigned int *)(thisINT + (0x10 + 0x4 * this->numEntries + 0x4 * entryNumber));
  if (offset == 0) return 0;
  AICEStringEntry* entry = &(*(AICEStringEntry*)(thisINT + offset));
  return entry->getStringEntry(index);
}