class_name PerceptionArea2D
extends Area2D


@export var is_player := false

@export var radius := 256.0

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var texture_circle: TextureCircle = $TextureCircle


func _ready():
	set_radius(radius)

func _on_body_entered(body: Node2D):
	if not body.is_in_group("sheep"):
		return
	
	body.set_home(self)
	
	if is_player:
		set_radius(get_radius() + 2)


func _on_body_exited(body: Node2D):
	if not body.is_in_group("sheep"):
		return
	
	body.set_home(null)


func set_radius(value: float):
	collision_shape.scale = Vector2.ONE * value
	texture_circle.radius = value


func get_radius() -> float:
	return texture_circle.radius
