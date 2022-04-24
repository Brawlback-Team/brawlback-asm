
#include "soAnimCmdModuleImpl.h"
#include "soWorkManageModuleImpl.h"

int soAnimCmdArgument::asInt() {
  return *(int *) value;
}

float soAnimCmdArgument::asScalar() {
  return *(float *) value / 60000.0;
}

void* soAnimCmdArgument::asOffset() {
  return value;
}

VariableArg* soAnimCmdArgument::asVariable() {
  int val = *(int *) value;
  return new VariableArg (
    *(VariableMemoryType*)((val & 0xF0000000) >> 28),
    *(VariableDataType*)((val & 0x0F000000) >> 24),
    *(void**)(val & 0x00FFFFFF)
  );
}

void* soAnimCmdArgument::asRequirement() {
  return value;
}

bool soAnimCmdArgument::asBool() {
  return (*(int *) value) == 1;
}

int* VariableArg::asInt(soWorkManageModuleImpl* workModule) {
  switch (memoryType) {
    case VariableMemoryType::InternalConstant: return nullptr;
    case VariableMemoryType::LongtermAccess:
      return &(*(int (*)[workModule->LAVariables->basicsSize])workModule->LAVariables->basics)[*(int*) address];
    case VariableMemoryType::RandomAccess:
      return &(*(int (*)[workModule->RAVariables->basicsSize])workModule->RAVariables->basics)[*(int*) address];
  }
  return nullptr; 
}

float* VariableArg::asFloat(soWorkManageModuleImpl* workModule) {
  switch (memoryType) {
    case VariableMemoryType::InternalConstant: return nullptr;
    case VariableMemoryType::LongtermAccess:
      return &(*(float (*)[workModule->LAVariables->floatsSize])workModule->LAVariables->floats)[*(int*) address];
    case VariableMemoryType::RandomAccess:
      return &(*(float (*)[workModule->RAVariables->floatsSize])workModule->RAVariables->floats)[*(int*) address];
  }
  return nullptr; 
}

bool* VariableArg::asBool(soWorkManageModuleImpl* workModule) {
  switch (memoryType) {
    case VariableMemoryType::InternalConstant: return nullptr;
    case VariableMemoryType::LongtermAccess:
      return &(*(bool (*)[workModule->LAVariables->bitsSize])workModule->LAVariables->bitVariables)[*(int*) address];
    case VariableMemoryType::RandomAccess:
      return &(*(bool (*)[workModule->RAVariables->bitsSize])workModule->RAVariables->bitVariables)[*(int*) address];
  }
  return nullptr; 
}

#define UNINITALIZED (void*) 0xCCCCCCCC
soAnimCmd* soInstanceUnitFullProperty_20soAnimCmdControlUnit::getCommand(int commandIdx) {
  if (arrayAddressPack == nullptr || arrayAddressPack->start == nullptr || arrayAddressPack->start == UNINITALIZED) return nullptr;
  // OSReport("COMMAND START ADDR: %08x\n", &arrayAddressPack->start);
  return &arrayAddressPack->start[commandIdx];
}