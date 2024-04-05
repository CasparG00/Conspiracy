extends Node


var perception_areas: Array[PerceptionArea2D] = []


func add_perception_area(area: PerceptionArea2D):
	perception_areas.append(area)


func remove_perception_area(area: PerceptionArea2D):
	perception_areas.erase(area)


func _give_denial():
	for area in perception_areas:
		if area is PlayerPerceptionArea2D:
			area.denial_active = true


func _give_dissociation():
	for area in perception_areas:
		if area is PlayerPerceptionArea2D:
			continue

		area.dissociation_active = true