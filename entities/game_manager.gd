extends Node


var perception_areas: Array[PerceptionArea2D] = []


func add_perception_area(area: PerceptionArea2D):
	perception_areas.append(area)


func remove_perception_area(area: PerceptionArea2D):
	perception_areas.erase(area)
