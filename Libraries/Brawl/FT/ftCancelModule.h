//
// Created by dareb on 9/19/2020.
//

#ifndef PROJECTMCODES_FTCANCELMODULE_H
#define PROJECTMCODES_FTCANCELMODULE_H

struct ftCancelModule {
    int isEnableCancel();
    int unableCancelStatus();
};

#define _unableCancelStatus_ftCancelModule ((int (*)(ftCancelModule* self)) 0x8084bd74)
#define _isEnableCancel_ftCancelModule ((int (*)(ftCancelModule* self)) 0x8084bd6c)

#endif //PROJECTMCODES_FTCANCELMODULE_H
