#########################################################
[Legacy TE] Masquerade Costume Flags V2 [ds22, DukeItOut]
#########################################################
op subi r0, r31, 0x32 @ $8084CD48
* 02AD817C 003200FF

###########################################################################################
[Legacy TE] Set Masquerade Costume Count to Zero to have up to 50 costumes v1.1 [DukeItOut]
###########################################################################################
HOOK @ $8084CFFC
{
  andi. r12, r0, 0xFFFE
  beq- masqueradeBypass
  lis r12, 0x8084
  ori r12, r12, 0xD004
  mtctr r12
  bctr 
masqueradeBypass:
  and. r0, r3, r0
}
op rlwinm r5, r23, 0, 26, 31 @ $8084D00C
op rlwinm r3, r0, 0, 26,  31 @ $8081C3D4
byte 0x34		     @ $8045A374	// '4'
half 0xBB9 		     @ $800E1F0E
HOOK @ $800E1F24
{
  	cmpwi r31, 0x2D;   bne+ notWarioman
 	li r3, 9000; b %END%
notWarioman:
 	mulli r3, r3, 50
}
HOOK @ $800E8B08
{
  	cmpwi r5, 0x35;   bne+ notWarioman
 	li r3, 9000; b %END%
notWarioman:
 	mulli r3, r3, 50
}
HOOK @ $800E8C04
{
  	cmpwi r5, 0x35;   bne+ notWarioman
 	li r3, 9000; b %END%
notWarioman:
 	mulli r3, r3, 50
}
op rlwinm r6, r23, 0, 26, 31 @ $8084D518
op rlwinm r6, r23, 0, 26, 31 @ $8084D814
op rlwinm r6, r23, 0, 26, 31 @ $8084DAF0
op rlwinm r5, r23, 0, 26, 31 @ $8084DED4
op rlwinm r0, r23, 0, 26, 31 @ $8084CC28
op rlwinm r5, r23, 0, 26, 31 @ $8084CB6C
HOOK @ $800E1F24
{
  	cmpwi r31, 0x2D; # WARIO ->MAN<- 
	bne+ notWAH
WAH: 	li r3, 9000	 # EH HEH
  	b %END%
notWAH:
 	mulli r3, r3, 50
}
op rlwinm r0, r6, 2, 26, 29 @ $8082A830
op rlwinm r0, r6, 2, 26, 29 @ $8082AB20
op rlwinm r0, r6, 0, 28, 31 @ $8082AB3C
op rlwinm r0, r6, 0, 28, 31 @ $8082AB5C
op rlwinm r0, r6, 0, 28, 31 @ $8082AB6C
op rlwinm r0, r6, 0, 28, 31 @ $8082AB8C
op rlwinm r0, r6, 0, 28, 31 @ $8082ABAC
op rlwinm r0, r6, 0, 28, 31 @ $8082ABBC
op rlwinm r0, r6, 0, 28, 31 @ $8082ABDC
op rlwinm r0, r6, 0, 28, 31 @ $8082ABFC
op rlwinm r0, r6, 0, 28, 31 @ $8082AC0C
op rlwinm r0, r6, 0, 28, 31 @ $8082A84C
op rlwinm r0, r6, 0, 28, 31 @ $8082A86C
op rlwinm r0, r6, 0, 28, 31 @ $8082A87C
op rlwinm r0, r6, 0, 28, 31 @ $8082A89C
op rlwinm r0, r6, 0, 28, 31 @ $8082A8BC
op rlwinm r0, r6, 0, 28, 31 @ $8082A8CC
op rlwinm r0, r6, 0, 28, 31 @ $8082A8EC
op rlwinm r0, r6, 0, 28, 31 @ $8082A90C
op rlwinm r0, r6, 0, 28, 31 @ $8082A91C
byte 50 		    @ $80692DA7
byte 50 		    @ $80692507
byte[4] 0x30, 0x34, 0x64, 0 @ $806A17D8

###################################################################
[Legacy TE] Upload Character Masquerade Data At Startup [DukeItOut]
###################################################################
string "/info/costumeslots/%02d.masq" @ $80546FE0
HOOK @ $8002D508
{
  stwu r1, -0xF0(r1)
  mflr r0
  stw r0, 0xF4(r1)
  stw r31, 0x0C(r1)
  stw r30, 0x10(r1)
  stw r29, 0x14(r1)
  stw r28, 0x18(r1)
  stw r3, 0x24(r1)
  stw r4, 0x28(r1)
  stw r5, 0x2C(r1)
  lis r31, 0x8045			# \
  ori r31, r31, 0x5450		# /
  stw r31, 0x1C(r1)
  lis r31, 0x8054			# \ Where to write the masquerade files to
  ori r31, r31, 0x7000		# /
  stw r31, 0x20(r1)
  li r29, 0x0

loc_0x44:
  addi r3, r1, 0x60
  lis r4, 0x8054  			# \ Pointer to the string, above.
  ori r4, r4, 0x6FE0		# /
  mr r5, r29
  lis r12, 0x803F  			# \
  ori r12, r12, 0x89FC		# | sprintf
  mtctr r12					# |
  bctrl 					# /
  lwz r5, 0x20(r1)
  addi r3, r1, 0x30
  addi r4, r1, 0x60
  li r6, 0x0
  li r7, 0x0
  lis r12, 0x8002			# \
  ori r12, r12, 0x239C		# | set the read parameter
  mtctr r12					# |
  bctrl 					# /
  addi r3, r1, 0x30
  lis r12, 0x8001			# \
  ori r12, r12, 0xBF0C		# | load the file
  mtctr r12					# | 
  bctrl 					# /
  lwz r30, 0x1C(r1)
  lwz r31, 0x20(r1)
  cmplwi r29, 39			# clone engine slots skip the below
  bgt+ loc_0xB4
  stwu r31, 0x10(r30)		# Store the address in the character information area
  stw r30, 0x1C(r1)
loc_0xB4:
  addi r31, r31, 102		# Each file is 102 bytes
  stw r31, 0x20(r1)
  addi r29, r29, 0x1
  cmplwi r29, 42			# 42 characters in total + Pokemon Trainer's slot
  ble+ loc_0x44
  lwz r3, 0x24(r1)
  lwz r4, 0x28(r1)
  lwz r5, 0x2C(r1)
  lwz r0, 0xF4(r1)
  lwz r31, 0x0C(r1)
  lwz r30, 0x10(r1)
  lwz r29, 0x14(r1)
  lwz r28, 0x18(r1)
  mtlr r0
  addi r1, r1, 0xF0
  lbz r0, 0x278(r3)			# Original operation
}