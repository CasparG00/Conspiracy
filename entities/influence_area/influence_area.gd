extends Area2D


@export var radius := 256.0: set = set_radius


func set_radius(value: float):
	$CollisionShape2D.shape = CircleShape2D.new()
	$CollisionShape2D.shape.radius = value

	$TextureCircle.radius = value


func get_radius() -> float:
	return $TextureCircle.radius