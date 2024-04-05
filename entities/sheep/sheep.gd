class_name Sheep
extends CharacterBody2D


const SPEED := 50
const WANDER_RADIUS = 2048

var target_position := Vector2.INF

var current_area: PerceptionArea2D


func _ready():
	target_position = global_position


func _physics_process(_delta: float):
	var wish_velocity := Vector2.ZERO

	var target_area: PerceptionArea2D

	if not current_area:
		target_area = find_new_target()
	else:
		if current_area.dissociation_active:
			current_area = null
			target_area = find_new_target()

	if target_area:
		target_position = target_area.global_position
	elif current_area:
		target_position = current_area.global_position
	else:
		target_position = global_position
	
	wish_velocity += global_position.direction_to(target_position) * SPEED

	velocity = wish_velocity
	move_and_slide()


func find_new_target() -> PerceptionArea2D:
	# find the area that has the most followers.
	var target_area: PerceptionArea2D
	for area: PerceptionArea2D in GameManager.perception_areas:
		if not target_area:
			target_area = area

		if area.dissociation_active:
			continue
		
		if area.denial_active:
			return area

		# Choose the area with the most followers.
		if area.followers.size() > target_area.followers.size():
			target_area = area

	return target_area