##################################################################################################
[Project+] Solo Pokemon Trainer Pokemon (other PT Pokemon recognize independence) [DukeItOut, Eon]
##################################################################################################
byte 0x6C @ $8082C5DB	# Force Pokemon to be treated normally
op b 0x194 @ $8084C768	# Do not load FitPokeTrainerEff.pac!

	.BA<-CharizardModule
	.BA->$80AD8114
	.BA<-SquirtleModule
	.BA->$80AD8118
	.BA<-IvysaurModule
	.BA->$80AD811C
	.GOTO->ModuleNameSkip
IvysaurModule:
	string "ft_pokefushigisou.rel"	
CharizardModule:
	string "ft_pokelizardon.rel"
SquirtleModule:
	string "ft_pokezenigame.rel"	
ModuleNameSkip:
	.RESET

######################################
Independent Pokemon for Subspace [Eon]
######################################
HOOK @ $800af80c
{
squirtCheck:
	cmpwi r3, 0x1D
	bne ivyCheck
	li r3, 0x20
	blr
ivyCheck:
	cmpwi r3, 0x1E
	bne charizardCheck
	li r3, 0x22
	blr
charizardCheck:
	cmpwi r3, 0x1C
	bne base 
	li r3, 0x1E
	blr
base:
	lis r4, 0x8058
}


op li r3, 0x1E @ $806E8870 #SetCharizard
op li r3, 0x22 @ $806E88D4 #SetIvysaur
op li r3, 0x20 @ $806E88DC #SetSquirtle

op li r3, 0x1E @ $806Ec5a0 #SetCharizard
op li r3, 0x22 @ $806Ec5ec #SetIvysaur
op li r3, 0x20 @ $806Ec5f4 #SetSquirtle

op li r3, 0x1E @ $806Ec2b8 #SetCharizard
op li r3, 0x22 @ $806Ec318 #SetIvysaur
op li r3, 0x20 @ $806Ec320 #SetSquirtle

op li r3, 0x1E @ $806Ec410 #SetCharizard
op li r3, 0x22 @ $806Ec470 #SetIvysaur
op li r3, 0x20 @ $806Ec478 #SetSquirtle


op li r19, 0x1E @ $806dae70
op li r19, 0x20 @ $806daec0

#also requires a module edit to sora_adv_stage.rel, nop 4 commands at 0x187F0
#and a custom stage file for the great maze PT fight is included that fixes the enemy loaded to Charizard