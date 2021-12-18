###################################
Clone Engine Data Saving Fix [ds22]
###################################
op cmpwi r3, 0x3A @ $80952AEC
op cmpwi r3, 0x3A @ $80952B2C
half[2] 0x2C0B, 0x3068 @ $80B2DD3C
half[2] 0x2D11, 0x356F @ $80B2DD40
byte[24] |
0x32, 0x1D, 0x24, 0x21, |
0x33, 0x1C, 0x1B, 0x4B, |
0x34, 0x13, 0x2E, 0x2D, |
0x35, 0x22, 0x2F, 0x5B, |
0x36, 0x0B, 0x0B, 0x17, |
0x37, 0x20, 0x25, 0x55  |
@ $80B2DD54 

###################################
Clone Engine Corps Stock Fix [ds22]
###################################
op cmpwi r4, 0x3A 				@ $80952F14

###################
Result Names [ds22]
###################
* 0459E03C 526F7900 #   "Roy"
* 044564A4 4D657774 # \ "Mewtwo"
* 044564A8 776F0000 # /
int 0 @ $804564AC
int 0 @ $804564B0
int 0 @ $804564B4
address $80456540 @ $80456624
address $8059E060 @ $8045662C
* 04456540 47696761 # \	"Giga Bowser"
* 04456544 20426F77 # |
* 04456548 73657200 # /
* 04456558 57617269 # \ "Wario-Man"
* 0445655C 6F2D4D61 # |
* 04456560 6E000000 # /

######################
Clone Engine Main Code
######################
# Roy
int 0x145 @ $80AD8A7C
address $80585820 @ $80AD7EDC
address $8058582F @ $80AD813C
int[4] 0x27,-1,-1,-1 @ $80AD8578
int[6] 2, 1, 0, 1, 1, 1 @ $80B0BAC8
int 0    @ $80B0BAFC
# Mewtwo
int 0x144 @ $80AD8A78
address $8058583A @ $80AD7ED8
address $8058584F @ $80AD8138
int[4] 0x26, -1, -1, -1   @ $80AD8588
int[6] 1, 1, 1, 1, 1, 1 @ $80B0BA90
int 0 @ $80B0BAC4
# Knuckles
int 0x0176 @ $80AD8A94
address $8058585D @ $80AD7EF4
address $80585876 @ $80AD8154
int[4] 0x2D, -1, -1, -1 @ $80AD85A8
int[6] 2, 3, 1, 2, 1, 1 @ $80B0BC18
int 0 @ $80B0BC40
int 0 @ $80B0BC4C

string[6]            		     |
"roy/FitRoy.pac",                |	// $80585820
"ft_roy.rel",                    |  // $8058582F
"mewtwo/FitMewtwo.pac",          |  // $8058583A
"ft_mewtwo.rel",                 |  // $8058584F
"knuckles/FitKnuckles.pac",      |  // $8058585D
"ft_knuckles.rel",               |  // $80585876
@ $80585820

##############################
Mewtwo Fixes [Dantarion, ds22]
##############################
.macro AFix()
{
  stw r0, 0(r2)
  mulli r0, r4, 0xC
  lwzx r3, r3, r0
  lwz r0, 0(r2)
}
HOOK @ $80853FA4
{
  %AFix()
}
HOOK @ $80853F44
{
  %AFix()			// Yes, this is the same as the above outside of hookpoint
}
HOOK @ $80853F7C
{
  %AFix()			// Likewise.
}
op cmpwi r30, 5 @ $80AA95A8
op beq- 0xC     @ $80AA95B4
HOOK @ $80AA95B8
{
  cmpwi r30, 0x21;  bne- loc_0xC
  lis r3, 0x22
loc_0xC:
  cmpwi r30, 0x26;  bne- %END%
  lis r3, 0x8F
}
HOOK @ $80AA9D60
{
  cmpwi r3, 0x26;  bne- loc_0x10
  li r6, 0x24;  b %END%
loc_0x10:
  li r6, 0x1F
}
CODE @ $80AA9D64
{
  lwz r12, 0(r23)
  mr r4, r23
  addi r3, r1, 0x68
  li r5, 0x3
  lwz r12, 152(r12)
}
HOOK @ $80AA9D98
{
  cmpwi r6, 0x24;  bne- loc_0x10
  li r6, 0x24;  b %END%
loc_0x10:
  li r6, 0x35
}
HOOK @ $80AAA768
{
  cmpwi r3, 0x26;  bne- loc_0x10
  li r6, 0x24;  b %END%
loc_0x10:
  li r6, 0x1F
}
CODE @ $80AAA76C
{
  lwz r12, 0(r27)
  mr r4, r27
  addi r3, r1, 0x14
  li r5, 0x3
  lwz r12, 0x98(r12)
}
HOOK @ $80AAA7A0
{
  cmpwi r6, 0x24;  bne- loc_0x10
  li r6, 0x3D;  b %END%
loc_0x10:
  li r6, 0x35
}

############################################################
Kirby Lucario Clone Aura Sphere GFX Fix [ds22, DesiacX, Eon]
############################################################
.macro GFXFix(<FighterID>,<Effect.pacID>)
{
    cmpwi r3, <FighterID>
    bne- 0xC
    lis r3, <Effect.pacID>
    b end
}
HOOK @ $80AA95AC
{
  bne notKirby
#awkward memory stuff to get to LA-Basic[72] of the projectile
  lwz r3, -8(r20) #get module accessor
  lwz r3, 0x64(r3) #get work module
  lwz r3, 0x20(r3) #get LA's
  lwz r3, 0xC(r3) #get Basic's
  lwz r3, 0x120(r3) #get LA-Basic[72] (*0x4 = 0x120)
  %GFXFix(0x26, 0x96) #MewtwoHat
lucarioHat:
notKirby:
  lis r3, 0x123

end:
  cmpwi r30, 0x5

}

##########################
Result Camera Fixes [ds22]
##########################
* 06B29ADC 00000070 //
* 41000000 40900000 // 8.0, 4.5 
* 41200000 00000032 // 10.0, "32"
* 3F800000 40E00000 // 1.0, 7.0
* 40C00000 40C00000 // 6.0, 6.0
* 00000033 3F866666 // "33", 1.05
* 40C00000 40C00000 // 6.0, 6.0
* 40400000 00000034 // 3.0, "34"
* 3F800000 3FC00000 // 1.0, 1.5
* 40E00000 40800000 // 7.0, 4.0
* 00000035 3F7851EC // "35", 0.97
* 40900000 40900000 // 4.5, 4.5
* 40600000 00000037 // 3.5, "37"
* 3F800000 3FC00000 // 1.0, 1.5
* 40E00000 40800000 // 7.0, 4.0




#####################
Cosmetic Stuff [ds22]
#####################
word 0x202A 		 	  @ $80455890
byte[4] 0x27, 1, 0x32, -1 @ $80455918
byte[4] 0xE, 0, 0, 0 	  @ $8045591C
word 0x201D 		 	  @ $80455920
byte[4] 0x7, 0, 0, 0 	  @ $804559AC

###############
Clone CSS Slots
###############
word[4] 0x32FF1D24, 9,      0x80548056, 0 @ $80585DD0
word[4] 0x33FF1C1B, 0x19C0, 0x80547FF0, 0 @ $80585DE0
word[4] 0x35FF222F, 0x19CF, 0x805480BC, 0 @ $80585E00
byte 0x33 				  @ $8045588A


Knuckles Fixes
* 064559C8 0000000C
* 2A0135FF 12000000
* 00001FF0 00000000
string "Knuckles" @ $80456534

##########################
Clone Victory Music [ds22]
##########################
* 80000000 804088C0	# \
* 80000001 80585EF0	# | Copy 0xCC bytes from 804088C0 to 80585EF0
* 8A00CC01 00000000	# / 
op lis r3, 0x8058		@ $800E6B4C
op addi r3, r3, 0x5EF0	@ $800E6B54
op li r0, 0x1C 			@ $800E6B58
int 0xFF27 @ $80408988
int[5] 0xFF26, 0x284D, 0xFF2D, 0x284D, 0x2844 @ $80585FBC
#0xFF26 (Mewtwo), 0xFF27 (Roy), 0xFF2D (Knuckles)

############################
Clone Result Name SFX [ds22]
############################
* 80000000 80408A44	# \
* 80000001 80585FF0	# | Copy 0xCC bytes from 80408A44 to 80585FF0
* 8A00CC01 00000000	# /
op lis r3, 0x8058		@ $800EB22C
op addi r3, r3, 0x5FF0	@ $800EB234
op li r0, 0x1B 			@ $800EB230
int 0x201D @ $80408B0C
int[4] 0x202A, 0x1FDE, 0x1FF0, 0x817983A0 @ $805860BC

#####################################
![Project+] Mewtwo Kirby Fixes [ds22]
#####################################
HOOK @ $80AA95AC
{
  bge- loc_0x28
  lwz r3, -8(r20)
  lwz r3, 0x64(r3)
  lwz r3, 0x20(r3)
  lwz r3, 0xC(r3)
  lwz r3, 0x120(r3)
  cmpwi r3, 0x26
  bne- loc_0x28
  lis r3, 0x96
  b loc_0x2C
loc_0x28:
  lis r3, 0x123
loc_0x2C:
  cmpwi r30, 0x5
}

##############################
Roy & M2 Kirby Hat Data [ds22]
##############################
string "kirby/FitKirbyMewtwo.pac" @ $80585AC4  # original didn't apply a null character!
string[3] "kirby/FitKirbyRoy.pac","","" @ $80585AE0
address $80585AC4 @ $80AD7FB4
address $80585AE0 @ $80AD7FB8
int 0x36 @ $80AD8B54
int 0x3A @ $80AD8B58
byte[4] 0, 1, 1, 2 @ $80AD801C

##################################
[Project+] Knuckles Hat Data [Eon]
##################################
string "kirby/FitKirbyKnuckles.pac" @ $80585AA4
address $80585AA4 @ $80AD7FD0
int 0x3A          @ $80AD8B70
byte[4] 2,2,1,2   @ $80AD8024

#######################################
[Project+] Kirby CE Hat Prop Fix [ds22]
#######################################
HOOK @ $80A58448
{
  lwz r4, 8(r3)
  lwz r4, 0x70(r4)
  lwz r4, 0x20(r4)
  lwz r4, 0xC(r4)
  lwz r4, 0x120(r4)
}
op lwz r4, 0x24(r1) @ $80853F00


#############################
Roy Hat Float Fix [dantarion]
#############################
HOOK @ $80A1A5B0
{
  cmpwi r6, 0x27;  bne- loc_0xC
  li r6, 0x11
loc_0xC:
  cmpwi r6, 0x26;  bne- loc_0x18
  li r6, 0x21
loc_0x18:
  mulli r0, r4, 0xDC
}

###############################################################################################
Classic and All-Star Ending Choice Engine v1.1d [DukeItOut]
#
# v1.1: addresses quirk where Wario-Man would be misinterpreted as ZSS due to range limitations
#			This version is more robust about understanding if it is in Classic or All-Star
# v1.1b: fixed misinterpretation of the default value
# v1.1c: fixes compatibility with Boss Battles
# v1.1d: rewrote to remove ambiguity for Boss Battles to prevent issues
################################################################################################
# r29 = r30 if in Classic (r30 holds cosmetic ID of character)
# r29 = r30 + 50 in All-Star as a roundabout way to get to strings in the same table, equivalent to +0x960 within the table
CODE @ $806C1428
{
	andis. r0, r0, 0x8000
	bne- 0x10
}
op NOP @ $806C14A4 # Redundant code split that makes this code unstable if not NOP'd
CODE @ $806C148C
{
	andis. r0, r0, 0xC000
	beq+ 0x08
}
CODE @ $806C14DC	
{
	andis. r12, r0, 0x8000		# Determines if a video should play. r0 will be useful in a bit, so don't clear it!
	bne- 0x10					# Make this "b 0x10" to always skip playing a video at the end of Classic/All-Star!
}
CODE @ $806C151C
{
	andis. r0, r0, 0x8000
	bne- 0x1C
}
CODE @ $806C155C
{
	andis. r0, r0, 0x8000
	bne- 0x10
}
CODE @ $806C15A0
{
	andis. r0, r0, 0x8000
	bne- 0x10
}

op oris r5, r5, 0x4000 @ $806E36B8	# Instead of adding 50, use 4000 as an All-Star flag for how to load the imagery
op oris r5, r5, 0x8000 @ $806E4E54	# Instead of adding 100, use 8000 as a Boss Battles flag for how to load the imagery
op NOP @ $806C1460
CODE @ $806C146C
{
	lhz r3, 0x282(r3)	# Avoid custom All-Star flag
	NOP
	NOP
}	// Force an ID check for a character

HOOK @ $806C14B0
{
	andi. r3, r29, 0xFFFF
	andis. r12, r29, 0x8000
	beq+ notBoss
	addi r3, r3, 100		# Compensation for removing 100 before
notBoss:
	mulli r0, r3, 0x30
}
HOOK @ $806C14C0		
{
	andi. r6, r29, 0xFFFF  # Force to read normally
	andis. r7, r29, 0x8000
	bne- BossBattles

	lis r12, 0x806C        	# \
	lwz r12, 0x14C8(r12)	# | Access ending ID from the table that has a pointer at $806C14C8!
	lbzx r5, r12, r6       	# /
	cmplwi r5, 0xFF;bne+ notDefault	# Use -1 (0xFF) as a value when you don't have Classic or All-Star results ready for the character!
default:
	addi r4, r31, 8
	andis. r12, r29, 0x4000; beq Classic_a
AllStar_a:
	addi r4, r4, 0x960		# Go to All-Star section
Classic_a:
	b setString
notDefault:
	addi r3, r31, 0x57
	andis. r12, r29, 0x4000; beq Classic_b
AllStar_b:
	addi r3, r31, 0x9B4		# Go to All-Star section
Classic_b:

	lis r4, 0x8048;	 ori r4, r4, 0xD9F8		# "%02d"	
	lis r12, 0x803F; ori r12, r12, 0x89FC 	# \ sprintf
	mtctr r12								# |
	bctrl									# /
	li r3, 0x2E								# \ "."					 
	andis. r12, r29, 0x4000; beq Classic_c	# |
AllStar_c:									# |
	addi r4, r31, 0x998						# Go to All-Star section to replace the period
	stb r3, 0x1E(r4)						# |
	b setString								# |
Classic_c:									# |
	addi r4, r31, 0x38						# | Replace the period lost	
	stb r3, 0x21(r4)						# /	
	b setString 
BossBattles:
	add r4, r31, r0							# Original operation
	addi r4, r4, 8
setString:	
	lwz r3, 0x14A8(r31)	# restore r3
	li r5, 43
	li r6, 0		# This was originally cleared before this set of hooks was made
	li r7, 0
}
op b 0x8 @ $806C14C4
	.BA<-ENDINGTABLE
	.BA->$806C14C8
	.GOTO->ENDINGTABLESKIP
ENDINGTABLE:
	byte[54] |	
		 1,  2,  3,  4,  5,  6,  7,  8, |	# These are based on the cosmetic ID
		 9, 10, 11, 12, 13, 42, 42, 16, |	# Zelda and Sheik use 42
		17, 18, 19, 20, 38, 22, 23, 24, |	#
		25, 26, 27, 31, 28, 28, 28, 32, |	# Mewtwo is 31 instead of 28 so Pokemon Trainer monsters can access PT's.
		33, 34, 35, 37, 40, 41, -1, 44, |	# 40 used by Roy!
		46, 47, -1, -1, -1, -1, -1, 43, |   # 43 used by Knuckles!
    	12, -1, -1, -1, -1, 38

# Unused slots: 14, 15, 21, 29, 30, 31*, 36, 39, 40*, 43*, 45		*= Used by Project+

ENDINGTABLESKIP:
	.RESET

#######################################################################
Clone Classic & All-Star Result Data V1.21 [ds22, Dantarion, DukeItOut]
#######################################################################
#
# Useful trophy IDs for general modders that stumble across this asm file:
#
# 0x145 = Mewtwo
# 0x113 = Isaac
# 0x10A = Lyn
# 0x116 = Shadow
# 0x0FF = Waluigi
# 0x1A8 = Toad
# 0x1E6 = Dark Samus
# 0x224 = Blood Falcon
# 0x225 = Black Shadow
# 0x22C = Roy (Ashnard in Brawl)
# 0x24E = Knuckles
#
# To find more, locate figdisp.pac and rummage through the texture data
# Convert the decimal value to hex to get the trophy ID
####################################################################################
.alias Roy_Slot = 0x32
.alias Mewtwo_Slot = 0x33
.alias Knuckles_Slot = 0x35
.alias Giga_Bowser_Slot = 0x2C
.alias Wario_Man_Slot = 0x2D
.alias Mewtwo_Trophy = 0x145
.alias Roy_Trophy = 0x22C
.alias Knuckles_Trophy = 0x24E
.alias Giga_Bowser_Trophy = 0x17
.alias Wario_Man_Trophy = 0x29
.alias Giga_Bowser_Trophy_AllStar = 0x68
.alias Wario_Man_Trophy_AllStar = 0x6F

HOOK @ $800791F0		# Music-related?
{
  lwz r12, 0x170(r3)
  cmpwi r12, 0x0;  beq- loc_0x14
  mr r3, r12;  b %END%
loc_0x14:
  lwz r3, 0x194(r3)
}
HOOK @ $806E29D0		# Character trophy to load for Classic
{
  cmpwi r28, 0x2B;  ble+ GotTrophy
  li r29, Mewtwo_Trophy;  cmpwi r28, Mewtwo_Slot;  beq+ GotTrophy	# If it's Mewtwo's PM slot
  li r29, Roy_Trophy; 	  cmpwi r28, Roy_Slot;	   beq+ GotTrophy	# If it's Roy's PM slot
  li r29, Knuckles_Trophy;cmpwi r28, Knuckles_Slot;beq+ GotTrophy	# if it's Knuckles' P+ slot 
  li r29, Giga_Bowser_Trophy;cmpwi r28, Giga_Bowser_Slot;beq+ GotTrophy	# if it's Giga Bowser's slot 
  li r29, Wario_Man_Trophy;cmpwi r28, Wario_Man_Slot;beq+ GotTrophy	# if it's Wario-Man's slot 
  li r29, 0x1		# Default to Mario!!!
GotTrophy:
  rlwinm r3, r29, 0, 16, 31
}
HOOK @ $806E47D8	# Character trophy to load for All-Star 
{
  cmpwi r4, 0x2B;  ble+ GotTrophy
  li r26, Mewtwo_Trophy;  cmpwi r4, Mewtwo_Slot;   beq+ GotTrophy	# If it's Mewtwo's PM slot
  li r26, Roy_Trophy; 	  cmpwi r4, Roy_Slot;	   beq+ GotTrophy	# If it's Roy's PM slot
  li r26, Knuckles_Trophy;cmpwi r4, Knuckles_Slot; beq+ GotTrophy	# if it's Knuckles' P+ slot 
  li r26, Giga_Bowser_Trophy_AllStar;cmpwi r4, Giga_Bowser_Slot; beq+ GotTrophy	# if it's Giga Bowser's slot 
  li r26, Wario_Man_Trophy_AllStar;cmpwi r4, Wario_Man_Slot; beq+ GotTrophy	# if it's Wario-Man's slot 
  li r26, 0x5D		# Default to Mario Finale!!!
GotTrophy:
  rlwinm r3, r26, 0, 16, 31
}
HOOK @ $806C1480
{
  cmpwi r29, 0x30;  blt+ loc_0xC
  li r29, 0x1
loc_0xC:
  mr r30, r29
}