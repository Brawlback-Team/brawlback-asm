#ifndef PROJECTMCODES_SORESOURCEMODULE_H
#define PROJECTMCODES_SORESOURCEMODULE_H

struct soResourceModuleImpl {
  char _spacer[0xC];
  // 0xC
  int managerID;
  // 0x10
  void* resourceIdAccesser;
  // 0x14
  char archiveType1;
  // 0x15
  char archiveType2;
  // 0x16
  char archiveType3;
  // 0x17
  char archiveType4;
};

#endif