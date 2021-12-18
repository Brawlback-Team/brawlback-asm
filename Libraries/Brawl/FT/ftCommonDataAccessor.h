//
// Created by dareb on 9/12/2020.
//

#ifndef PROJECTMCODES_FTSTATUSCOMMON_H
#define PROJECTMCODES_FTSTATUSCOMMON_H

struct ftCommonDataAccessor {
    unsigned int* getFtStatusData(int fighterID, int ftAction);
};

//static location of global ftCommonDataAccessor object
#define FIGHTER_COMMON_DATA_ACCESSOR ((ftCommonDataAccessor*) 0x80b87fcc)

#define _getFtStatusData_ftCommonDataAccessor ((unsigned int* (*)(ftCommonDataAccessor* self, int fighterID, int ftAction)) 0x8084ff60)


#endif //PROJECTMCODES_FTSTATUSCOMMON_H
