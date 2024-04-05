class_name PerceptionArea2D
extends Area2D


@export var radius := 256.0: 
	set(value):
		radius = max(16.0, value)

		$CollisionShape2D.shape.radius = value
		$TextureCircle.radius = value


var followers: Array[Sheep] = []

var denial_active := false
var acting_out_active := false
var dissociation_active := false


func _enter_tree():
	GameManager.add_perception_area(self)


func _exit_tree():
	GameManager.remove_perception_area(self)


func _on_body_entered(body: Node2D):
	followers.append(body)
	body.current_area = self


func _on_body_exited(body: Node2D):
	followers.erase(body)
	body.current_area = null
