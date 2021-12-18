#############################################################
Custom Victory Themes v1.2a [Dantarion, KingJigglypuff]
#
# Clone Engine Character victory IDs are in CloneEngine.asm
# Remove this code if using BrawlEX/PMEX/P+EX! 
# It's redundant, then, if it is present.
#############################################################
uint32_t[46] |
	0xFF00, 0xFF01, 0xFF02, 0xFF03, 0xFF18, | // Mario, Donkey Kong, Link, Samus, Zero Suit Samus
	0xFF04, 0xFF05, 0xFF06, 0xFF07, 0xFF08, | // Yoshi, Kirby, Fox, Pikachu, Luigi
	0xFF09, 0xFF0A, 0xFF0B, 0xFF0C, 0xFF0D, | // Captain Falcon, Ness, Bowser, Peach, Zelda
	0xFF0E, 0xFF0F, 0xFF0F, 0xFF0F, 0xFF11, | // Sheik, Ice Climbers, Popo, Nana, Marth
	0xFF12, 0xFF13, 0xFF14, 0xFF15, 0xFF16, | // Mr. Game & Watch, Falco, Ganondorf, Wario, Meta-Knight
	0xFF17, 0xFF19, 0xFF1A, 0xFF1B, 0xFF1D, | // Pit, Olimar, Lucas, Diddy Kong, Charizard
	0xFF1D, 0xFF1E, 0xFF1E, 0xFF1F, 0xFF1F, | // Charizard (Solo), Squirtle, Squirtle (Solo), Ivysaur, Ivysaur (Solo)
	0xFF20, 0xFF21, 0xFF22, 0xFF23, 0xFF25, | // Dedede, Lucario, Ike, R.O.B., Jigglypuff
	0xFF29, 0xFF2C, 0xFF2E, 0xFF2F, 0xFF30, | // Toon Link, Wolf, Snake, Sonic, Giga Bowser
	0xFF31 |								  // Wario-Man
	@ $804088C0
# Unique IDs:
# FF0B: Victory!/Bowser

####################################################
Classic and All-Star Results Music Table [DukeItOut]
####################################################
HOOK @ $806E0980		# Classic Mode
{
	lbz r0, 0x33(r15)	# Get the character ID, original operation
	rlwinm r0, r0, 1, 0, 30	# Multiply by 2
	lis r3, 0x806E		# \ Get pointer to table
	lwz r3, 0x0988(r3)	# /
	lhzx r3, r3, r0		# Get 16-bit value for the song ID
	oris r0, r3, 0xFF00	# For unknown reasons, having FF in the two highest digits is used for verification
}
HOOK @ $806E3650		# All-Star Mode
{
	lbz r0, 0x98(r6)	# Get the character ID
	rlwinm r0, r0, 1, 0, 30	# Multiply by 2
	lis r3, 0x806E		# \ Get pointer to table
	lwz r3, 0x0988(r3)	# /
	lhzx r3, r3, r0		# Get 16-bit value for the song ID
	oris r0, r3, 0xFF00	# For unknown reasons, having FF in the two highest digits is used for verification
}
op b 0x8 @ $806E0984	# Skip operation afterwards since we are using a different load method
	.BA<-ClassicResultsTable
	.BA->$806E0988
	.GOTO->SkipResultsTable
ClassicResultsTable:
	half[56] | # Slots
		0x271A, 0x272D, 0x2739, 0x2748, | # Mario, Donkey Kong, Link, Samus
		0x2748, 0x2750, 0x275A, 0x276E, | # Zero Suit Samus, Yoshi, Kirby, Fox
		0x276F, 0x271C, 0x277A, 0x278F, | # Pikachu, Luigi, Captain Falcon, Ness
		0x281D, 0x271A, 0x273B, 0x273B, | # Bowser, Peach, Zelda, Sheik
		0x27C9, 0x27C9, 0x27C9, 0x280F, | # Ice Climbers, Popo, Nana, Marth
		0x27D4, 0x2765, 0x273F, 0x27A2, | # Mr. Game & Watch, Falco, Ganondorf, Wario
		0x275C, 0x27C0, 0x279F, 0x2796, | # Meta Knight, Pit, Olimar, Lucas
		0x272D, 0x2770, 0x2770, 0x2770, | # Diddy Kong, PT Charizard, Solo Charizard, PT Squirtle
		0x2770, 0x2770, 0x2770, 0x2758, | # Solo Squirtle, PT Ivysaur, Solo Ivysaur, Dedede
		0x2776, 0x278D, 0x27C4, 0x2770, | # Lucario, Ike, ROB, Jigglypuff
		0x273E, 0x2767, 0x27EC, 0x27FE, | # Toon Link, Wolf, Snake, Sonic
		0x281D, 0x27A2, 0x0000, 0x0000, | # Giga Bowser, Wario-Man, Red Alloy, Blue Alloy
		0x0000, 0x0000, 0x2788, 0xF000, | # Yellow Alloy, Green Alloy, Roy ("MarioD"), Mewtwo ("BossPackun")
		0x0000, 0xF001, 0x0000, 0x0000	  # "Rayquaza", Knuckles ("PorkyStatue"), "Porky", "HeadRobo"
# Original table at $80702418
SkipResultsTable:
	.RESET