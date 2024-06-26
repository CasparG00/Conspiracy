extends Area2D


@export var button_group: ButtonGroup
@export var player_area: Node2D

@onready var texture_circle: TextureCircle = $TextureCircle


func _process(_delta):
	global_position = get_global_mouse_position()
	
	if Input.is_action_just_released("cast"):
		_handle_action()

	texture_circle.rotate(0.5 * _delta)

func _handle_action():
	var pressed_button := button_group.get_pressed_button()
	if not pressed_button:
		return
	
	var sheep := get_overlapping_bodies().filter(func(value): return value.is_in_group("sheep"))
	
	match pressed_button.get_name():
		"Denial":
			for entry: Node in sheep:
				if entry.home_area:
					return
				
				entry.set_target(player_area)
		"ActingOut":
			print("Making them Act out!")
		"Dissociate":
			for entry: Node in sheep:
				if not entry.home_area:
					return
				
				entry.set_target(player_area)
