extends Area2D


const BASE_RADIUS = 256

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var texture_circle: TextureCircle = $TextureCircle


func _ready():
	set_radius(BASE_RADIUS)


func set_radius(radius: float):
	collision_shape.shape = CircleShape2D.new()
	collision_shape.shape.radius = radius

	texture_circle.radius = radius