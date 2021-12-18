//
// Created by johno on 7/28/2020.
//

#ifndef PROJECTMCODES_OSINTERRUPT_H
#define PROJECTMCODES_OSINTERRUPT_H


//returns true if interupts were enabled before
#define _OSDisableInterrupts ((bool (*)()) 0x801dcf10)
//returns true if interupts were enabled before
#define _OSEnableInterrupts ((bool (*)()) 0x801dcf24)
//returns true if interupts are enabled now
#define _OSRestoreInterrupts ((bool (*)(bool shouldEnable)) 0x801dcf38)

#endif //PROJECTMCODES_OSINTERRUPT_H
