extends Node


const SPAWN_COUNT = 128
const SPAWN_RADIUS = 2048

@export var sheep_scene: PackedScene


func _ready():
	for i: int in SPAWN_COUNT:
		spawn_sheep()


func spawn_sheep():
	var offset := Vector2(randf() * 2 - 1, randf() * 2 - 1)
	offset = offset.normalized() * min(offset.length(), 1) * SPAWN_RADIUS

	var sheep := sheep_scene.instantiate()
	sheep.position += offset

	add_sibling.call_deferred(sheep)
