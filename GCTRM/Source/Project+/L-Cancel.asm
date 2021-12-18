L-Cancelling Rework [Eon]
.macro getInt(<id>)
{
    %workModuleCmd(<id>, 0x18)
}
.macro setInt(<id>)
{
.alias arg_Hi = <id> / 0x10000
.alias arg_Lo = <id> & 0xFFFF
    lis r5, arg_Hi
    ori r5, r5, arg_Lo
	%ModuleCmd(0x64, 0x1C)
}
.macro decInt(<id>)
{
    %workModuleCmd(<id>, 0x28)
}
.macro workModuleCmd(<id>, <cmd>)
{
.alias arg_Hi = <id> / 0x10000
.alias arg_Lo = <id> & 0xFFFF
    lis r4, arg_Hi
    ori r4, r4, arg_Lo
	%ModuleCmd(0x64, <cmd>)
}

.macro ModuleCmd(<module>, <cmd>)
{
    lwz r3, 0xD8(r31)
    lwz r3, <module>(r3)
    lwz r12, 0x0(r3)
    lwz r12, <cmd>(r12)
    mtctr r12
    bctrl
}
#initStatus
HOOK @ $80874314
{
	stwu r1, -0x30(r1)
	mflr r0
	stw r0, 0x34(r1)
	stw r31, 0xC(r1)
  stw r30, 0x10(r1)
	mr r31, r4

	li r4, 0
	%setInt(0x1000005a)


  %getInt(0x1000004D)
  cmpwi r3, 1
  beq lcancel
  #controller module get held
  %ModuleCmd(0x5C, 0xAC) 
  mr r30, r3
  #controller module get pressed this frame
  %ModuleCmd(0x5C, 0xA0)
  and r3, r30, r3
  andi. r3, r3, 0x8
  beq end
lcancel: 
	li r4, 0x7
	%setInt(0x1000005a)
end:
  lwz r30, 0x10(r1)
	lwz r31, 0xC(r1)
	lwz r0, 0x34(r1)
	mtlr r0
	addi r1, r1, 0x30
	blr
}

#execStatus
HOOK @ $80874318 
{
	stwu r1, -0x30(r1)
	mflr r0
	stw r0, 0x34(r1)
	stw r31, 0xC(r1)
	stw r30, 0x10(r1)
	mr r31, r4

  %getInt(0x1000004D)
  cmpwi r3, 1
  beq lcancel
  #controller module get held
  %ModuleCmd(0x5C, 0xAC) 
  mr r30, r3
  #controller module get pressed this frame
  %ModuleCmd(0x5C, 0xA0)
  and r3, r30, r3
  andi. r3, r3, 0x8
  beq decCount
lcancel:
	li r4, 0x7
	%setInt(0x1000005a)
	b end


	#decrement lcancel timer every frame, detect shield and set to 8 if so

decCount:
	%decInt(0x1000005a)
end:
	#original command equivalent, writing what was r4 to r3
	mr r3, r31
	lwz r31, 0xC(r1)
  lwz r30, 0x10(r1)
	lwz r0, 0x34(r1)
	mtlr r0
	addi r1, r1, 0x30
  lis r12, 0x808a
  ori r12, r12, 0x019C
  mtctr r12
  bctr
}

word 0x8087431C @ $80B11830
word 0x8087431C @ $80B0DCB8
#execStop
HOOK @ $8087431C 
{
	stwu r1, -0x30(r1)
	mflr r0
	stw r0, 0x34(r1)
	stw r31, 0xC(r1)
	stw r30, 0x10(r1)
  mr r31, r4
  
	#if requirement 0x4E (any shield pressed)
  %getInt(0x1000004D)
  cmpwi r3, 1
  beq lcancel
  #controller module get held
  %ModuleCmd(0x5C, 0xAC) 
  mr r30, r3
  #controller module get pressed this frame
  %ModuleCmd(0x5C, 0xA0)
  and r3, r30, r3
  andi. r3, r3, 0x8
  beq end
lcancel:
	li r4, 0x8
	%setInt(0x1000005a)
end:
	lwz r31, 0xC(r1)
  lwz r30, 0x10(r1)
	lwz r0, 0x34(r1)
	mtlr r0
	addi r1, r1, 0x30
	blr
}



L-Cancel Landing Lag and Success Rate and Score Display is Auto L-Cancel Option + White L-cancel Flash v3.0 [Magus, Standardtoaster, wiiztec, Eon]
#check frame = 6 and disable flash
HOOK @ $80874850 
{
	cmpwi r3, 0x5
	mr r31, r3
	bne end
	#soColorBlendModule
	lwz r3, 0xD8(r28)
	lwz r3, 0xAC(r3)
	li r4, 1
	lwz r12, 0(r3)
	lwz r12, 0x20(r12)
	mtctr r12
	bctrl
end:
	lwz r4, 0xD8(r28)
}
#land and detect lcancel state, set flash and stat appropriately
op nop @ $8081BE8C
HOOK @ $8087459C
{
loc_0x0:
#get LA-Basic[90]
  lwz r3, 0xD8(r31)
  lwz r3, 0x64(r3)
  lis r4, 0x1000
  ori r4, r4, 90
  
  lwz r12, 0x0(r3)
  lwz r12, 0x18(r12)
  mtctr r12
  bctrl 
  cmpwi r3, 0
  ble checkForAutoLcancel
trueLcancel:
  #start flash effect
  lwz r3, 0xD8(r31)
  lwz r3, 0xAC(r3)

  #initial colour
  lis r0, 0xFFFF
  ori r0, r0, 0xFFDC
  addi r4, r1, 0x18
  stw r0, 0(r4)

  li r5, 1
  lwz r12, 0(r3)
  lwz r12, 0x24(r12)
  mtctr r12
  bctrl

  lwz r3, 0xD8(r31)
  lwz r3, 0xAC(r3)
  #time to transition
  lis r0, 0x40C0
  stw r0, 0x18(r1)
  lfs f1, 0x18(r1)
  #target colour of transition
  lis r0, 0xFFFF
  ori r0, r0, 0xFF00
  addi r4, r1, 0x18
  stw r0, 0(r4)
  #true
  li r5, 1

  lwz r12, 0x0(r3)
  lwz r12, 0x28(r12)
  mtctr r12
  bctrl
  li r6, 1
  b applyLcancel
checkForAutoLcancel:  
  li r6, 0
  lis r11, 0x9017
  ori r11, r11, 0xF36B
  lbz r11, 0(r11)
  cmpwi r11, 0x1
  bne calcStat
applyLcancel:  
#load 0.5

  lfs f0, -23448(r2)
  fmuls f30, f30, f0

#everything past this point is for the stat
calcStat:
#add one to total aerial count
  cmpwi r6, 0x0
  lis r6, 0x80B8
  ori r6, r6, 0x8394
  lfs f6, 0(r6)
  #gets a pointer to LA-Basic data
  lwz r4, 0xD8(r31)
  lwz r4, 0x64(r4)
  lwz r4, 0x20(r4)
  lwz r4, 0xC(r4)

  lfs f5, 0x238(r4)
  fadds f5, f5, f6
  stfs f5, 0x238(r4)

  lis r5, 0x80B8
  lwz r5, 0x7C28(r5)
  lwz r5, 0x154(r5)
  lwz r5, 0(r5)
  lwz r6, 0x8(r31)
  lwz r6, 0x10C(r6)
  rlwinm r6, r6, 0, 24, 31
  mulli r6, r6, 0x244
  add r5, r5, r6
  lwz r5, 40(r5)
  addi r5, r5, 0x850

#check lcancel occured
  ble loc_0x98
#successful L-cancel
  lis r6, 0x80B8
  ori r6, r6, 0x8394
  lfs f6, 0(r6)
  lfs f4, 572(r4)
  fadds f4, f6, f4
  stfs f4, 572(r4)

loc_0x98:
  lfs f4, 572(r4)
  fdivs f5, f4, f5
  lis r6, 0x80B8
  ori r6, r6, 0x83A0
  lfs f6, 0(r6)
  fmuls f5, f6, f5
  fctiwz f5, f5
  stfd f5, 48(r2)
  lhz r12, 54(r2)
  stw r12, 0(r5)
  fctiwz f30, f30
  stfd f30, 16(r2)
  lhz r12, 22(r2)
  lfd f0, -31632(r2)
  lis r3, 0x4330
  ori r3, r3, 0x0
  stw r3, 16(r2)
  xoris r12, r12, 32768
  stw r12, 20(r2)
  lfd f30, 16(r2)
  fsub f30, f30, f0
  fadds f31, f31, f1
  fdivs f31, f31, f30


}

Disable Aerial Attack Landing Lag IASA [Magus]
* 04FAF168 800000FF

Remove grabbing Items with Aerials [Eon]
CODE @ $80FC2798
{
  word 0x00020000; word 0
  word 0x00020000; word 0
  word 0x00020000; word 0
}

Aerial Staling Set before Subaction Set [Eon]
#nair
CODE @ $80FC2820
{
  word 0x0C1C0200; word 0x80FB2EC4
  word 0x04000100; word 0x80FB2EBC
}
#fair
CODE @ $80FC2848
{
  word 0x0C1C0200; word 0x80FB2F04
  word 0x04000100; word 0x80FB2EFC
}
#bair
CODE @ $80FC2860
{
  word 0x0C1C0200; word 0x80FB2F1C
  word 0x04000100; word 0x80FB2F14
}
#uair
CODE @ $80FC2888
{
  word 0x0C1C0200; word 0x80FB2F54
  word 0x04000100; word 0x80FB2F4C
}
#dair
CODE @ $80FC28A0
{
  word 0x0C1C0200; word 0x80FB2F6C
  word 0x04000100; word 0x80FB2F64
}

#############################################################
Teeter Cancelling [Shanus, Yeroc, Dantarion, Wind Owl, Magus]
#############################################################
.alias Teeter_Loc = 0x80546120

CODE @ $80546120
{
  word 2; word Teeter_Loc+0x8
  word 0x02010200; word 0x80FAF3EC
  word 0x00070100; word 0x80FABBB4
  word 0x00080000; word 0;
}
CODE @ $80FC1C58
{
  word 0x00070100; word Teeter_Loc
}