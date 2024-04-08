extends Node


@export var sheep_scene: PackedScene

var player_area: Area2D: set = set_player_area
var opponent_area: Area2D: set = set_opponent_area

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


func set_player_area(value: Area2D):
	player_area = value


func set_opponent_area(value: Area2D):
	opponent_area = value
