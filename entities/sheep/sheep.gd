extends CharacterBody2D


const SPEED = 200.0

var target: Node2D: set = set_target


func _physics_process(_delta):
	if not target:
		velocity = Vector2.ZERO
	else:
		var vector_to := target.global_position - global_position
		var wish_velocity: Vector2 = vector_to.normalized() * min(vector_to.length(), SPEED)
		velocity = wish_velocity
	
	move_and_slide()


func set_target(new_target: Node2D):
	target = new_target
