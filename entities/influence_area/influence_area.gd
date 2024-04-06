class_name PerceptionArea2D
extends Area2D


@export var radius := 256.0: 
	set(value):
		radius = max(16.0, value)

		$CollisionShape2D.shape.radius = value
		$TextureCircle.radius = value
