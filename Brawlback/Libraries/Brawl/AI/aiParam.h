#ifndef PROJECTMCODES_AIPARAM_H
#define PROJECTMCODES_AIPARAM_H

struct ATKDContent {
  short sact;
  short unk;
  short start;
  short end;
  float xmin;
  float xmax;
  float ymin;
  float ymax;
};

struct aiParam {
    ATKDContent* searchAtkData(short subactionID);

    int* AIPDPtr;
    int* ATKDPtr;
};

#define _searchAtkData_ATKDHead ((ATKDContent* (*)(int * self, short subactionID)) 0x8092a744) 

#endif //PROJECTMCODES_AIPARAM_H
