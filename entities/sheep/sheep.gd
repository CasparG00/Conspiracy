extends CharacterBody2D


const MAX_VELOCITY := 50

@onready var detection_area: Area2D = $DetectionArea

var influence_areas: Array[Area2D] = []


func _physics_process(_delta: float):
	var wish_velocity := Vector2.ZERO

	if not influence_areas.is_empty():
		var closest_area: Area2D = influence_areas.front()
		var direction_delta := closest_area.global_position - global_position
		wish_velocity += direction_delta.normalized() * (direction_delta.length() - closest_area.get_radius() * 0.5)
	
	# Clamp the wish_velocity to the max velocity.
	if wish_velocity.length_squared() > MAX_VELOCITY * MAX_VELOCITY:
		wish_velocity = wish_velocity.normalized() * MAX_VELOCITY

	velocity = wish_velocity
	move_and_slide()


func _on_detection_area_area_entered(area: Area2D):
	influence_areas.append(area)
	influence_areas.sort_custom(_sort_by_weight)


func _on_detection_area_area_exited(area: Area2D):
	influence_areas.erase(area)
	influence_areas.sort_custom(_sort_by_weight)


func _sort_by_weight(area1: Area2D, area2: Area2D) -> bool:
	var distance1 := global_position.distance_to(area1.global_position)
	var distance2 := global_position.distance_to(area2.global_position)

	var weight1: float = area1.get_radius() / distance1
	var weight2: float = area2.get_radius() / distance2

	return weight1 > weight2