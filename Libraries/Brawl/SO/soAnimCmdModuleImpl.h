#ifndef PROJECTMCODES_SOANIMCMDMODULEIMPL_H
#define PROJECTMCODES_SOANIMCMDMODULEIMPL_H

#include "Brawl/SO/soWorkManageModuleImpl.h"

enum VariableDataType : char {
  Int = 0,
  Float = 1,
  Bool = 2
};

enum VariableMemoryType : char {
  InternalConstant = 0,
  LongtermAccess = 1,
  RandomAccess = 2
};

struct VariableArg {
  VariableArg(VariableMemoryType memoryType, VariableDataType dataType, void* address) {
    this->memoryType = memoryType;
    this->dataType = dataType;
    this->address = address;
  }
  int* asInt(soWorkManageModuleImpl* workModule);
  float* asFloat(soWorkManageModuleImpl* workModule);
  bool* asBool(soWorkManageModuleImpl* workModule);
  VariableMemoryType memoryType;
  VariableDataType dataType;
  void* address;
};

// MAIN COMPONENTS

struct soAnimCmdArgument {
  int asInt();
  float asScalar();
  void* asOffset();
  bool asBool();
  // void* asFile();
  VariableArg* asVariable();
  void* asRequirement();

  int type;
  void* value;
};

struct soAnimCmd {
  char _module;
  char code;
  char numArguments;
  char option;
  soAnimCmdArgument (*argumentOffset)[];
};

struct soAnimCmdInterpreter {
  char _spacer[0x8];
  float frameSpeed;
  // 0xC
  soAnimCmd* currCommand;
  // 0x10
  soAnimCmd* CILStart;
  char _spacer2[0x1C - 0x10 - 4];
  // 0x1C
  soAnimCmd* latestWaitCommand;
  // 0x24
  char _spacer3[0x24 - 0x1C - 4];
  float logicalFrame;
};

struct soArrayVectorAbstract_acCmdInterpreterStackData {

};

struct soAnimCmdArrayAddressPackArraySeparate {
  char _spacer[0x8];
  soAnimCmd* start;
  char _spacer2[0x20 - 0x8 - 4];
  void* returnStack;
};

struct soInstanceUnitFullProperty_20soAnimCmdControlUnit {
  soAnimCmd* getCommand(int idx);
  soAnimCmdInterpreter* cmdInterpreter;
  soAnimCmdArrayAddressPackArraySeparate* arrayAddressPack;
  int ID;
  short type;
  short unk2;
};


struct soArrayVector_soInstanceUnitFullProperty_soAnimCmdControlUnit_11 {
  int* vtable1;
  int* vtable2;
  // 0x8
  short unk;
  char _spacer[0xC - 0x8 - 2];
  // 0xC
  union {
    struct {
      soInstanceUnitFullProperty_20soAnimCmdControlUnit ActionMain;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit SubactionMain;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit SubactionGfx;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit SubactionSfx;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit SubactionOther;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit AltSubactionMain;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit AltSubactionGfx;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit AltSubactionSfx;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit AltSubactionOther;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit ConcurrentInfiniteLoop;
      soInstanceUnitFullProperty_20soAnimCmdControlUnit ActionHidden;
    };
    soInstanceUnitFullProperty_20soAnimCmdControlUnit asArray[11];
  } threadUnion;
};
  
struct soInstanceManagerFullPropertyVector_soAnimCmdControlUnit_11 {
  int* vtable1;
  // 0x4
  char unk;
  char _spacer[0x8 - 0x4 - 1];
  // 0x8
  int* vtable2;
  int* vtable3;
  // 0x10
  soArrayVector_soInstanceUnitFullProperty_soAnimCmdControlUnit_11 instanceUnitFullPropertyArrayVector;
};


//
struct soAnimCmdModuleImpl {
    char _spacer[0x20];
    soInstanceManagerFullPropertyVector_soAnimCmdControlUnit_11* threadList;
};


#endif //PROJECTMCODES_SOANIMCMDMODULEIMPL_H
