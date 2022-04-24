Unstoppable articles Redone [Eon, catscatscats99]
#generalised function-based version of catscatscats99's original code. removes hardcoded offsets, adding support for all normally implemented projectiles.
#keeps support for all but ICs neutral b and for ness/lucas PK Fire, these are module based things that can be modified by changing the projectiles `notifyEventCollisionAttackCheck` in its module
#i've left the generalised support off these projectiles since overriding their code can break custom module stuff if done in cats's original way, as it basically just ignores the module
#
#checks for the value `1ABE11ED` in any of RA-Basic[0-6] of a projectile, and if set it will not get destroyed on hit
HOOK @ $808e59a8
{ 
  mr r31, r3 

  rlwinm. r0, r4, 0, 28, 28 #(00000008)  if on a reflector, just let it do reflector stuff
  bne end

  rlwinm.  r0, r4, 0, 29, 29 #(00000004) if on a shield 
  beq checkifunstoppable  #if not on shield, do unstoppable stuff
  lbz r0, 0xA4(r31)       #if on shield, check if should do rebound off shield at angle stuff
  rlwinm r0, r0, 25, 31, 31
  cmplwi r0, 1
  beq end
checkifunstoppable:
  #assign extra space in stack for preserving r4
  stwu r1, -0x14(r1)
  mflr r0
  stw r0, 0x18(r1)
  stw r30, 0x10(r1)
  stw r4, 0xC(r1)

  li r30, 0
startLoop:
  #getInt RA-Basic[n]
  lwz r3, 0x60(r31)
  lwz r3, 0xD8(r3)
  lwz r3, 0x64(r3)
  lis r4, 0x2000      #Ra Basic
  or r4, r4, r30
  lwz r12, 0(r3)
  lwz r12, 0x18(r12)
  mtctr r12
  bctrl
  #check if RA-Basic[n] = 1ABE11ED (LABELLED)
  lis r4, 0x1ABE
  ori r4, r4, 0x11ED
  cmpw r3, r4

  beq escapeLoop
  addi r30, r30, 1
  cmpwi r30, 6
  ble startLoop
escapeLoop:
  
  #return values out of stack
  lwz r4, 0xC(r1)
  lwz r30, 0x10(r1)
  lwz r0, 0x18(r1)
  mtlr r0
  addi r1, r1, 0x14

  bne end
  lis r12, 0x808E       #skip to end of check function if should be unstoppable
  ori r12, r12, 0x5AE4
  mtctr r12
  bctr 
end:
  mr r3, r31
  andi. r0, r4, 0x13
}