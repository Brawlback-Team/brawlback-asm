#################################################
Don't clear memory on game launch [Sammi Husky]
#################################################
op nop @ $801d5f64
op nop @ $801d5f68

#######################################################
run codehandler after initializing memory [Sammi Husky]
#######################################################
HOOK @ $80016c30 
{
    # __memfill
    lis r12, 0x8000
    ori r12, r12, 0x443c
    mtctr r12
    bctrl
    
    # codehandler
    lis r12, 0x8000
    ori r12, r12, 0x18a8
    mtctr r12
    bctrl
    
}

##################################################
run codehandler after loading rels [Sammi Husky]
##################################################
HOOK @ $800272b8
{
    stwu r1, -0x80(r1)
    mflr r0
    stw r0, 0x84(r1)
    stmw r3, 8(r1)
    
    # codehandler
    lis r12, 0x8000
    ori r12, r12, 0x18a8
    mtctr r12
    bctrl
    
    lmw r3, 8(r1)
    lwz r0, 0x84(r1)
    mtlr r0
    addi r1, r1, 0x80
    
    lwz r4, 0x0(r30)
}



########################################
Syringe Core Loader [Sammi Husky]
########################################
HOOK @ $80ad6738
{
    stwu r1, -0x20(r1)
    bl _main

    word 0x817ba5a0 # heap start
    word 0x79b00    # \ 
    word 0x4Cb900   # | Menu Instance sizes
    word 0x393400   # /
    
    word 0x53797269 # "Syringe"
    word 0x6E676500
    
    word 0x73795F63 # "sy_core.rel"
    word 0x6F72652E
    word 0x72656C00

_main:
    mflr r31
    
    # check if we have BrawlEx. 
    # we do this because if BEX is running
    # our heap addr will be different
    li r3, 0x3B
    lis r12, 0x8002
    ori r12, r12, 0x49cc
    mtctr r12
    bctrl # getHeap
    cmpwi r3, 0
    lswi r3, r31, 16 # loads our data into r3-r6
    beq _noBex
    lis r0, 1       # \
    sub r3, r3, r0  # | If brawlex is present, our heap start will
    sub r4, r4, r0  # | need to be 0x10000 earlier and menu instance
    sub r5, r5, r0  # | needs to be reduced by the same amount.
    sub r6, r6, r0  # /

_noBex:
    lis r7, 0x8042
    stw r4, 0x1D84(r7) # \
    stw r5, 0x2254(r7) # | Write our menuInstance size patches
    stw r6, 0x2394(r7) # /

_createHeap:
    lis r4, 1
    addi r5, r31, 0x10
    lis r6, 0x8049
    ori r6, r6, 0x4D18
    stw r5, 0(r6)
    stw r3, 4(r6)
    stw r4, 8(r6)
    lis r12, 0x8002
    ori r12, r12, 0x59A4
    mtctr r12
    bctrl # create/[gfMemoryPool]
    
_loadModule:
    addi r3, r1, 0x8
    lwz r4, -0x43e8(r13) # ModuleManager
    addi r5, r31, 0x18
    li r6, 0x3C
    li r7, 1
    li r8, 0
    lis r12, 0x8002
    ori r12, r12, 0x6E00
    mtctr r12
    bctrl # loadModuleRequest

    addi r1, r1, 0x20
    lwz r0, 0x14(r1) # original instruction
}

########################################
all your mem2 are belong to us [Glitch]
########################################
* 08003118 08000000
* 20010004 00000000
* 04003120 97FE0000
* 08003128 97FC0000
* 20010008 00000000
* 08003134 97FE0000
* 20010004 00000000

#########################################################
Don't print out OSReport calls on DumpAll [WhiteTPoison]
#########################################################
op nop @ $80024a78
op nop @ $80024a84
op nop @ $80024a90
op nop @ $80024aec
op nop @ $80024adc
op nop @ $80024ae0
op nop @ $800260fc
op nop @ $80026114
op nop @ $800260f0
op nop @ $800262ac
op nop @ $80026278
op nop @ $800260e0
op nop @ $80026288
op nop @ $8002619c
op nop @ $800261b4
op nop @ $800262e0
