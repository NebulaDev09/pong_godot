extends StaticBody2D

const JUMP_VELOCITY = 400

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ru"):
		position.y -= JUMP_VELOCITY * delta
	elif Input.is_action_pressed('rd'):
		position.y += JUMP_VELOCITY * delta
	position.y = clamp(position.y, 40, 608)
	
func change_scene(winner):
		var over = preload("res://scenes/over.tscn")
		var over_instance = over.instantiate()
		var label = over_instance.get_node("Label")
		label.text = "Winner: " + winner

		get_tree().root.add_child(over_instance)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = over_instance
