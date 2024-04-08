extends Node


var tutorial_events := [
	"You are a conspiracy theory. \n
	This is a sheep.",

	func(): print("spawn sheep"), # Make them go to the player.

	"Sheep look for truth. \n
	Some seek out your truth, others will find the real truth.",

	"If a sheep will not find your truth, \n
	you can give them a nudge by putting them in denial about the truth they seek.",
	
	func(): print("spawn sheep"), # Make them go to  the other one
]