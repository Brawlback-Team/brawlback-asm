
#ifndef PROJECTMCODES_ITRESOURCEMODULEIMPL_H
#define PROJECTMCODES_ITRESOURCEMODULEIMPL_H

#include "Brawl/SO/soResourceModuleImpl.h"

struct CommonParams {

};

struct ParamsList {
  void* ownParams[0xF0];
};

struct ParamTable {
  ParamsList* itemParams[0xb0];
};

struct AllParamSection {
  CommonParams* common;
  ParamsList** itemParamTable;
};

struct itResourceModuleImpl : public soResourceModuleImpl {
  char _spacer[0xC];
  // 0xC
  soResourceModuleImpl soResourceModuleImplInst;
  // 0x24
  soResourceModuleImpl* soResourceModuleImplInstPtr;
  char _spacer2[0x2C - 0x24 - 4];
  // 0x2C
  AllParamSection* allParams;
  // 0x30
  CommonParams* commonParams;
  // 0x34
  ParamsList* ownParams;
  // 0x38
  void* animParams;
};

#endif