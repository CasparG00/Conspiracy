extends Node


const SPAWN_RADIUS = 2048

@export var sheep_scene: PackedScene


func spawn_sheep():
	var offset := Vector2(randf() * 2 - 1, randf() * 2 - 1)
	offset = offset.normalized() * SPAWN_RADIUS

	var sheep := sheep_scene.instantiate()
	sheep.position += offset

	sheep.set_target(get_parent())

	add_sibling(sheep)


func _on_timer_timeout():
	spawn_sheep()
