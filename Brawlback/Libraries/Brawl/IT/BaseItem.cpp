
#include "BaseItem.h"

void BaseItem::warp(Vec3f* location) {
  _warp_BaseItem(this, location);
}

void BaseItem::throwAttack(Vec3f* speeds) {
  _throwAttack_BaseItem(this, speeds);
}

float BaseItem::getParamF(int paramIdx) {
  return _fGetParam_BaseItem(this, paramIdx);
}

int BaseItem::getParamI(int paramIdx) {
  return _iGetParam_BaseItem(this, paramIdx);
}