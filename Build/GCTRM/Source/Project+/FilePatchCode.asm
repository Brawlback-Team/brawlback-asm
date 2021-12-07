#############################
[Project+] SD Root=/Project+/
#############################
string "/Project+/" @ $80406920

##########################
Remove "RSBX" from SD Path
##########################
op stb r0, -0x1(r5) @ $8003A430
op NOP				@ $8003A43C
op stb r0, -0x1(r5) @ $8003A8E0
op NOP				@ $8003A8EC
op stb r0, -0x1(r5) @ $8003AF40
op NOP				@ $8003AF4C
op stb r0, -0x1(r5) @ $8003B960
op NOP				@ $8003B96C
op stb r0, -0x1(r5) @ $8003BDDC
op NOP				@ $8003BDE8
op stb r0, -0x1(r5) @ $8003CB1C
op NOP				@ $8003CB28

##############################################################################################
[Legacy TE] File Patch Code v3.5.2 (NTSC-U) (projectm/) [Phantom Wings, DukeItOut]
#
# 3.5.2: Prevents race condition from having multiple files load at the same time. [DukeItOut]
##############################################################################################
* E0000000 80008000
* 225664EC 00000000

# Chooses to read from the SD or DVD
# Checks a string at 805A7C0C

op b 0x58BE20 @ $8001BFE0
CODE @ $805A7E00
{
	li r5, 0x67
	addi r4, r1, 0x20
	stwu r1, -0x180(r1)
	stw r4, 0x8(r1)
	lis r4, 0x8040		#\ Mod folder
	ori r4, r4, 0x6920	#/
	addi r3, r1, 0x10
	lis r12, 0x803F 
	ori r12, r12, 0xA340
	mtctr r12
	bctrl
	li r5, 0x7066		# \ "pf"
	sth r5, 0x1A(r1)	# /
	li r5, 0x7F
	addi r3, r1, 0x1C	# String address + 12 (assumed length of "/Project+/" + "pf")
	lwz r4, 0x8(r1)		# Actual filename
	bctrl
	li r5, 0x68
	addi r4, r1, 0x10
	addi r3, r1, 0x188	# original 0x8(r1) with the 0x180 offset
	stw r4, 0x188(r1)	# Force a string redirect
	stwu r1, -0x80(r1)
	stmw r2, 0x8(r1)
	lis r12, 0x8001				# \
	ori r12, r12, 0xCBF4		# | Read from SD
	mtctr r12					# |
	bctrl						# |
	mr r28, r3					# /
	cmpwi r3, 0
	bne notFoundOnSD
	addi r1, r1, 0x80
	b finish	
notFoundOnSD:
	lmw r2, 0x8(r1)
	addi r1, r1, 0x80
	lwz r4, 0x8(r1)			# Get filename
	addi r3, r1, 0x1A0		# \ Revert parameter pointer to original string (0x20(r1))
	stw r3, 0x188(r1)		# /
	addi r3, r1, 0x188		# Original 0x8(r1) + 0x180 added
	lis r12, 0x8001			# \
	ori r12, r12, 0xC144	# | Read from DVD
	mtctr r12				# |
	bctrl					# |
	mr r28, r3				# /
finish:
	addi r1, r1, 0x180
	lis r12, 0x8001
	ori r12, r12, 0xC054
	mtctr r12
	bctr
}

# Related to setting parameters for file loading
* 040223E0 48585BC0
* 065A7FA0 00000028
* 80010044 3C608001
* 6063581C 7C001800
* 4082000C 7FDDC850
* 3BDEFFE0 93DB0008
* 4BA7A424 00000000

# Related to memory allocation
* 0401CD0C 4858B1F4
* 065A7F00 00000038
* 2C030000 4182000C
* 4BA7DD51 4BA74E04
* 80780008 2C030000
* 41820014 8118000C
* 7C634214 7C7B1850
* 48000008 8078000C
* 4BA74DE0 00000000

op b 0x14 @ $803EE9D8
op b 0x14 @ $803EEBD4
op b 0x18 @ $803D8B9C
op li r3, 0 @ $803E9B4C
op li r3, 0 @ $803E9D38
op NOP @ $803D8C80

* 80000000 80406920	# Copies the mod name header (10 bytes)
* 80000001 805A7C00	# to 805A7C00
* 8A000A01 00000000

* 065A7C0A 00000002	#
* 70660000 00000000 # Adds "pf" ?!?

* 80000001 805A7B00 # Also copies the mod name header to 805A7B00
* 8A000A01 00000000	#

# string "pf/sound/" @ $805A7B0A # Warning, commented out because the null terminator for the string breaks the filenames!
* 065A7B0A 00000009				 #
* 70662F73 6F756E64				 #
* 2F000000 00000000				 #

# Related to music streams
* 041C6CE0 483E0D20
* 065A7A00 00000028
* 9421FF80 BC410008
* 3C60805A 60637B13
* 4BE52931 B8410008
* 38210080 4BE52995
* 4BC1F2C4 00000000

# Related to loading off the SD card
* 065A7900 00000078
* 9421FF80 7C0802A6
* 9001000C BC810010
* 9421FF00 7C872378
* 54B2BA7E 7CD33378
* 38800000 9081000C
* 90810010 90610014
* 90810018 3880FFFF
* 9081001C 38610020
* 90610008 7CE43B78
* 38A00080 4BE529F5
* 38610008 4BA752A1
* 60000000 80210000
* B8810010 8001000C
* 7C0803A6 80210000
* 4E800020 00000000

HOOK @ $803E399C
{
  lwz r5, 0x20(r28)
  add r5, r5, r18
  li r18, 0x0
}
HOOK @ $803DBAEC
{
	lwz r0, 0x2A4(r3)	# Get filesize
	cmpwi r19, 0
	beq- loc_0x10
	mr r0, r19			# if r19 is non-zero (r6 at 805A7900), then only load this much
loc_0x10:
	li r19, 0
}
HOOK @ $801CDF7C
{
  lwz r12, 0x14(r12)		# 801BEFC8
  stwu r1, -0x80(r1)
  stmw r2, 8(r1)			# r4 = stream buffer address, r5 = amount to update it, r6 = location in file?
  mr r8, r4
  lis r3, 0x804D			# Address the brstm file buffer goes to
  lis r4, 0x805A			# \ Pointer to brstm stream filename
  ori r4, r4, 0x7B00		# /
  
  mr r5, r6
  li r6, 0x4200
  lwz r7, 128(r4)
  cmpwi r7, 0x0;  bne- loc_0x54
  lis r12, 0x805A
  ori r12, r12, 0x7900
  mtctr r12
  bctrl
  cmpwi r3, 0x0;  beq- loc_0x60

loc_0x54:
  lmw r2, 8(r1)
  lwz r1, 0(r1)
  b %END%

loc_0x60:
  andi. r5, r5, 0x1FF
  subi r3, r8, 0x1
  lis r4, 0x804C
  ori r4, r4, 0xFFFF
  add r4, r4, r5
  li r5, 0x4001

loc_0x78:
  subi r5, r5, 0x1
  lbzu r0, 1(r4)
  stbu r0, 1(r3)
  cmpwi r5, 0x0;  bne+ loc_0x78
  lmw r2, 8(r1)
  lwz r1, 0(r1)

  lis r12, 0x801C
  ori r12, r12, 0xDFA0
  mtctr r12
  bctr			# Skip ahead 0x20 more than usual to skip streaming off disc
}
HOOK @ $801CCF90
{
  stwu r1, -0x80(r1)
  stmw r2, 8(r1)
  mr r3, r31
  lis r4, 0x805A
  ori r4, r4, 0x7B00
  li r5, 0x0
  li r6, 0x4000
  lis r12, 0x805A
  ori r12, r12, 0x7900
  mtctr r12				# Goes to 0x805A7900
  bctrl	
  stw r3, 0x80(r4)
  lwz r3, 8(r31)
  stw r3, 0x14(r26)
  stw r3, 0x5C(r26)
  stw r3, 0x74(r26)
  lmw r2, 8(r1)
  lwz r1, 0(r1)
  lwz r3, 0(r31)
}
.RESET

###############################################
Suppress OSReport For Music Streams [DukeItOut]
###############################################
HOOK @ $8001CD9C
{
	lis r12, 0x804D		# Songs are written to 804D0000 when read from the SD card.
	cmpw r29, r12
	blt- notMusic
	ori r12, r12, 0x4200
	cmpw r29, r12
	bge- notMusic
	lis r12, 0x8001
	ori r12, r12, 0xCDA4
	mtctr r12
	bctr
notMusic:
	crclr 6, 6			# Original operation
}

###############################################################
pfmenu2 fixes (sc_title, mu_menumain & if_adv_mngr) [Dantarion]
###############################################################
string "/menu2/sc_title.pac"     @ $806FF9A0
string "/menu2/mu_menumain.pac"  @ $806FB248
string "/menu2/if_adv_mngr.pac"  @ $80B2C7F8

##############################################################################################################################
[Project+] RSBE v1.30 (/Project+/pf/sfx, can load soundbank clones for stages) (requires CSSLE) [InternetExplorer, DukeItOut]
##############################################################################################################################
* 80000000 80406920
* 80000001 805A7D18
address $805A7D18 @ $805A7D00
string[2] "/Project+/pf/sfx/%03X",".sawnd" @ $805A7D18
* 045A7D10 919B6600		# What is this?
HOOK @ $801C8370																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																										
{
  stwu r1, -0x80(r1)
  stmw r3, 8(r1)
  lis r3, 0x805A
  ori r3, r3, 0x7000
  stwu r1, 8(r3)		# place r1 in 805A7008
  mr r1, r3
  addi r26, r26, 0x7	# add 7 to the soundbank ID for who knows what reason.
  lis r3, 0x805A
  ori r3, r3, 0x7D00
  stw r26, -0x20(r3)	# place r26 in 805A7CE0 after adding 7 to it. This will be the soundbank.

  li r4, 0x0
  stw r4, 0xC(r1)		# zero 805A700C, 805A7010 and 805A7018
  stw r4, 0x10(r1)		#\
  stw r27, 0x14(r1)		# | save r27 to 805A7014 
  stw r4, 0x18(r1)		#/
  li r4, 0xFFFF			#\-1 at 805A701C
  stw r4, 0x1C(r1)		#/
  addi r3, r1, 0x24		#\
  stw r3, 8(r1)			#/store 805A7020 to 805A7008 #points to "/private/wii/app/RSBE/pf/sfx/%03X."
  lis r4, 0x805A		#\set r4 to 805A7D18
  ori r4, r4, 0x7D18	#/
  subi r5, r26, 7		#move the soundbank to r5, but remove the 7 that wasn't needed before
  lis r12, 0x803F		#\
  ori r12, r12, 0x89FC	# |
  mtctr r12				# |branch to 803F89FC (sprintf/printf.o)
  bctrl 				#/
  cmpwi r26, 0x53		#\ Skip if not a normal stage soundbank
  blt+ NormalBank		# |
  cmpwi r26, 0x77		# |Stage soundbanks are range 0x53-0x77	(really 0x4C-70)
  bgt+ NormalBank		#/
  
  mr r4, r5				#
  lis r5, 0x5F00		# \ Concatenate "_"
  stw r5, 0x20(r1)		# /
  addi r4, r1, 0x20		#
  addi r3, r1, 0x24		# place the string character in r1+0x24
  lis r12, 0x803F		#
  ori r12, r12, 0xA384	# strcat
  mtctr r12				#
  bctrl 				#
  addi r3, r1, 0x24
  
  lis r12, 0x8053		# \ STEX pointer
  ori r12, r12, 0xF000	# /
  lwz r4, 0x1C(r12)		# Pointer to offset in string block for filename
  lwz r5, 0x4(r12)		# Pointer to string block
  add r4, r4, r12		# \ Obtain address for string of stage filename
  add r4, r4, r5		# /
  addi r3, r1, 0x24
  bctrl					# strcat again
  
  lis r4, 0x805A		# ".sawnd"	
  ori r4, r4, 0x7D2E	# 
  bctrl 				# strcat, yet again!
  addi r4, r1, 0x24		# r4 contains string containing the offset
  mr r3, r27
  li r5, 0x0
  li r6, 0x0
  lis r12, 0x805A		# \ use file patch code to retrieve file 
  ori r12, r12, 0x7900	# |
  mtctr r12				# |
  bctrl 				# /
  cmpwi r3, 0x0			# \ but if it exists . . . . 
  beq+ gotSawnd			# /
  addi r3, r1, 0x24 	# \
  stw r3, 8(r1)			# / store the pointer to the string to r1+0x8 
  lis r4, 0x805A		# \	
  ori r4, r4, 0x7D18	# / get the pointer to "/legacyte/pf/sfx/%03X"
  subi r5, r26, 7		# r5 contains the decimal value of the soundbank ID . . . . which was given 7 earlier
  lis r12, 0x803F		# \
  ori r12, r12, 0x89FC	# | sprintf
  mtctr r12				# |
  bctrl 				# / 

NormalBank:
  addi r3, r1, 0x24		# r3 contains the pointer to where the string should be written  
  lis r12, 0x803F		# \
  ori r12, r12, 0xA384	# | move strcat to the count register 
  mtctr r12				# /
  lis r4, 0x805A		
  ori r4, r4, 0x7D2E	# ".sawnd"
  bctrl 				# strcat! 
  addi r4, r1, 0x24		# retrieve the string 
  mr r3, r27			
  li r5, 0x0			#\
  li r6, 0x0			#/ zero out r5 and r6
  lis r12, 0x805A		#\
  ori r12, r12, 0x7900	# | File Patch Code	
  mtctr r12				# |
  bctrl 				#/
  cmpwi r3, 0x0			#\
  bne- noSawnd			#/ If this file doesn't exist, load from the BRSAR.

gotSawnd:
  lis r3, 0x805A
  ori r3, r3, 0x7D00
  lwz r4, -0x170(r1)
  stw r4, -0x30(r3)
  mr r4, r27
  subi r4, r4, 0x3
  lis r6, 0x5257		# \
  ori r6, r6, 0x5344	# /  "RWSD"

findRWSD:
  addi r4, r4, 0x4
  lwz r9, 0(r4)
  cmpw r9, r6
  bne+ findRWSD
  sub r4, r4, r27
  stw r4, -0x40(r3)
  lis r9, 0x90E6
  ori r9, r9, 0xF10
  lwz r9, 0(r9)
  mr r4, r9
  mr r6, r4
  addi r6, r6, 0x8
  lwz r5, 0x2C(r4)
  add r4, r4, r5
  addi r4, r4, 0x8
  lis r7, 0x805A
  ori r7, r7, 0x7D00
  lwz r11, -0x20(r7)

loc_0x24C:
  addi r4, r4, 0x8
  lwz r5, 0(r4)
  add r5, r5, r6
  lwz r7, 0(r5)
  cmpw r7, r11
  bne+ loc_0x24C
  mr r4, r9
  lwz r6, 0x24(r5)
  add r5, r4, r6
  addi r5, r5, 0x8
  lwz r7, 0(r5)
  addi r5, r5, 0x8
  mr r3, r27
  addi r3, r3, 0x9

loc_0x284:
  lwz r6, 0(r5)
  add r6, r4, r6
  subi r7, r7, 0x1
  lwz r10, 0(r3)
  stw r10, 8(r6)
  lwz r10, 4(r3)
  stw r10, 20(r6)
  lwz r10, 8(r3)
  stw r10, 24(r6)
  addi r3, r3, 0xC
  addi r5, r5, 0x8
  cmpwi r7, 0x0
  bgt+ loc_0x284
  lis r3, 0x805A
  ori r3, r3, 0x7D00
  lwz r4, -48(r3)
  lwz r5, -64(r3)
  sub r4, r4, r5
  mr r6, r27
  add r7, r6, r5

loc_0x2D4:
  lbz r8, 0(r7)
  stb r8, 0(r6)
  addi r6, r6, 0x1
  addi r7, r7, 0x1
  subi r4, r4, 0x1
  cmpwi r4, 0x0
  bgt+ loc_0x2D4
  li r3, 0x0

noSawnd:
  cmpwi r3, 0x0			# if r3 is zero, skip loading later
  lis r5, 0x805A		# \
  ori r5, r5, 0x7D00	# | store soundbank 
  stw r3, -0x10(r5)		# /
  lis r1, 0x805A		# \
  ori r1, r1, 0x7000	#  | Retrieve old registers 
  lwz r1, 8(r1)			#  |
  lmw r3, 8(r1)			#  |
  addi r1, r1, 0x80		# /
  mtctr r12
  beq- skipBRSAR		# see above
  bctrl 				# read from BRSAR
  b %END%
skipBRSAR:
  mr r3, r7
}
HOOK @ $801C8658
{
  lis r16, 0x805A		    #\
  ori r16, r16, 0x7D00		#/load 805A7D00, the hacked area
  lwz r17, -0x10(r16)		#\
  cmpwi r17, 0x0		    #/check if the sawnd is 0. It shouldn't be!
  bne- loc_0x20
  mr r3, r7
  li r25, 0x0
  beq- %END%

loc_0x20:
  bctrl 
  li r18, 0x1
  stw r18, -0x10(r16)
  nop 
}

########################
SDHC Extension 1.1[Bero]
########################
.macro LoadAddress(<arg1>,<arg2>)	// Simple register address load math
{
	.alias temp_Hi = <arg2> / 0x10000 
	.alias temp_Lo = <arg2> & 0xFFFF 
	lis <arg1>, temp_Hi
	ori <arg1>,<arg1>, temp_Lo	
}
.macro MakeJump(<arg1>,<arg2>)		// Simple jump directly to an address
{
	%LoadAddress(<arg1>,<arg2>
	mtctr <arg1>
	bctr
}


HOOK @ $803CB3D8
{
  rlwinm. r3, r3, 0, 11, 11
  beq- loc_0x18
  li r3, 0x1
  %LoadAddress(r4,0x80580300)
  stw r3, 0(r4)
loc_0x18:
  cmpwi r29, 0x0
}
HOOK @ $803EEE18
{
  lwz r3, 0x14(r1)
  rlwinm. r3, r3, 0, 9, 9
  beq- loc_0x30
  li r0, 0x9
  lwz r3, 0xC(r1)
  rlwinm r3, r3, 24, 16, 31
  addi r3, r3, 0x1
  mulli r6, r3, 0x400
  %MakeJump(r3,0x803EEE58) # | Jump to address 803EEE58 instead of going to 803EEE1C
loc_0x30:
  lwz r5, 0xC(r1)
}
HOOK @ $803CB620
{
  %LoadAddress(r11,0x805A9350)
  lwz r11, 0(r11)
  cmpwi r11, 0x0;  beq- loc_0x34
  cmpwi r4, 0x40;  beq- loc_0x34
  li r11, 0x1
  stw r11, 8(r1)
  %MakeJump(r11,0x803CB410)	# | Jump to 803CB410 instead of going to 803CB624
loc_0x34:
  stwu r1, -0x40(r1)
}
HOOK @ $803CB4AC
{
  li r6, 0x0
  cmpwi r22, 0x0;  beq- %END%
  li r6, 0x1
}
HOOK @ $803CB5D4
{
  lwz r3, 28(r28)
  cmpwi r3, 0x1
  lwz r3, -0x31E4(r13)
  beq- %END%
  lwz r0, 0(r3);  stw r0, 0(r25)
  lwz r0, 4(r3);  stw r0, 4(r25)
  lwz r0, 8(r3);  stw r0, 8(r25)
  lwz r0, 12(r3);  stw r0, 12(r25)
  %MakeJump(r3,0x803CB5E0)
}
op bl 0x191904 @ $803EEA20
op bl 0x191708 @ $803EEC1C
CODE @ $80580324
{
  %LoadAddress(r24,0x80580300)
  lwz r24, 0(r24)
  cmpwi r24, 0x0;  beq- loc_0x1C
  mr r25, r5;  b loc_0x20

loc_0x1C:
  mullw r25, r5, r6
loc_0x20:
  rlwinm. r0, r4, 0, 27, 31
  blr 
}
op bl 0x1917E0 @ $803EEB6C
op bl 0x1915E4 @ $803EED68

CODE @ $8058034C
{
  %LoadAddress(r3,0x80580300)
  lwz r3, 0(r3)
  cmpwi r3, 0x0;  beq- loc_0x1C
  addi r25, r25, 0x1;  b loc_0x20

loc_0x1C:
  add r25, r25, r23
loc_0x20:
  blr 
}
op bl 0x1B48E0 @ $803CBA24
op bl 0x1B45A4 @ $803CBD60
CODE @ $80580304
{
  %LoadAddress(r22,0x80580300)
  lwz r22, 0(r22)
  cmpwi r22, 0x0;  beq- loc_0x18
  mr r0, r4
loc_0x18:
  cmplw r4, r0
  blr 
}
HOOK @ $803EE0BC
{
  li r0, 0x0
  %LoadAddress(r3,0x805A9350)
  stw r0, 0(r3)
  lis r3, 0x805A
}

THP Replacement Engine v1.0 [Sammi Husky]
* 065A74DF 00000018
* 54485050 6C617965
* 724F7065 6E28293A
* 2025730A 00000000
* C207BE08 0000000C
* 9421FFE0 7C0802A6
* 90010024 93E1001C
* 93C10018 7C7F1B78
* 7C9E2378 3C60805A
* 606374DF 7FE4FB78
* 3D80801D 618C8600
* 7D8903A6 4E800421
* 7FE3FB78 7FC4F378
* 80010024 83E1001C
* 83C10018 7C0803A6
* 38210020 7FE4FB78
* 60000000 60000000
* 0407BE0C 4852B4F5
* 0407ED5C 485285A5
* 0407EE60 485284A1
* 065A7300 00000090
* 9421FF70 BC810008
* 7C0802A6 90010094
* 7C7A1B78 7C9B2378
* 9421FF80 7C641B78
* 3C60805A 60637C0C
* 38A00040 4BE53015
* 38610008 3C808059
* 6084C598 4BE52F45
* 3C80805A 60847C01
* 38A00080 4BE53065
* 3C808059 6084C590
* 4BE44B61 3C80805A
* 906474F8 38210080
* 2C030000 40820010
* 7F43D378 7F64DB78
* 4BC4EF01 B8810008
* 80010094 38210090
* 7C0803A6 4E800020
* 0407BEA0 4852B661
* 0407BF58 4852B5A9
* 0407C024 4852B4DD
* 0407C044 4852B4BD
* 0407E270 48529291
* 0407C6AC 4852AE55
* 0407C770 4852AD91
* 0407ED80 48528781
* 0407EE84 4852867D
* 065A7500 00000100
* 9421FFD0 7C0802A6
* 90010034 BF410008
* 7C7A1B78 7C9B2378
* 7CBC2B78 7CDD3378
* 7CFE3B78 3C60805A
* 806374F8 2C030000
* 41820020 3C608049
* 6063DDD0 7F64DB78
* 7F85E378 7FA6EB78
* 48000045 4800002C
* 7F43D378 7F64DB78
* 7F85E378 7FA6EB78
* 7FC7F378 2C070002
* 4182000C 4BC4F19D
* 48000008 4BC4F27D
* BB410008 80010034
* 38210030 7C0803A6
* 4E800020 9421FF80
* 7C0802A6 90010084
* BC810008 7C7A1B78
* 7C9B2378 7CBC2B78
* 7CDD3378 2C1D0000
* 41820020 3C60805A
* 806374F8 7FA4EB78
* 38A00000 4BE44925
* 2C030000 40820020
* 7F63DB78 38800001
* 7F85E378 3CC0805A
* 80C674F8 4BE440FD
* 48000004 B8810008
* 80010084 7C0803A6
* 38210080 4E800020
* 0407C19C 4852B065
* 0407BF0C 4852B2F5
* 0407C054 4852B1AD
* 0407EE08 485283F9
* 0407EF28 485282D9
* 0407EB98 48528669
* 065A7200 00000058
* 9421FF80 7C0802A6
* 90010084 BC810008
* 7C7A1B78 3C80805A
* 800474F8 2C000000
* 41820018 3C60805A
* 806374F8 4BE44C61
* 3C80805A 906474F8
* 7F43D378 B8810008
* 4BC4F2E5 80010084
* 7C0803A6 38210080
* 4E800020 60000000