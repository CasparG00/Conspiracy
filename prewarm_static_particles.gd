extends GPUParticles2D


func _enter_tree():
	await get_tree().process_frame
	speed_scale = .1
	await get_tree().process_frame
	speed_scale = 0