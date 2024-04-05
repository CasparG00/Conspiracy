extends CharacterBody2D


const MAX_VELOCITY := 50

@onready var detection_area: Area2D = $DetectionArea

var influence_areas: Array[Area2D] = []


func _physics_process(_delta: float):
	var wish_velocity := Vector2.ZERO
	for area in influence_areas:
		wish_velocity += area.global_position - global_position
	
	# Clamp the wish_velocity to the max velocity.
	if wish_velocity.length_squared() > MAX_VELOCITY * MAX_VELOCITY:
		wish_velocity = wish_velocity.normalized() * MAX_VELOCITY

	velocity = wish_velocity
	move_and_slide()


func _on_detection_area_area_exited(area: Area2D):
	influence_areas.append(area)


func _on_detection_area_area_entered(area: Area2D):
	influence_areas.erase(area)