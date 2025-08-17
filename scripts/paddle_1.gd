extends StaticBody2D

const JUMP_VELOCITY = 400

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("lu"):
		position.y -= JUMP_VELOCITY * delta
	elif Input.is_action_pressed('ld'):
		position.y += JUMP_VELOCITY * delta
	position.y = clamp(position.y, 40, 608)
