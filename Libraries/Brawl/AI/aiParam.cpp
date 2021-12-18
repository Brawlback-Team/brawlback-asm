

#include "aiParam.h"

ATKDContent* aiParam::searchAtkData(short subactionID) {
  return _searchAtkData_ATKDHead(this->ATKDPtr, subactionID);
}