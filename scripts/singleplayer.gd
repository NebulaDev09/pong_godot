extends Button

func _ready() -> void:
	$".".pressed.connect(func():
		var game = preload("res://scenes/game.tscn")
		var game_instance = game.instantiate()
		var paddle2 = game_instance.get_node("paddle2")
		paddle2.set_script(preload("res://scripts/paddle_2_singleplayer.gd"))
		var ball = game_instance.get_node("ball")
		ball.player_2 = 'CPU'

		get_tree().root.add_child(game_instance)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = game_instance
		)
	$"../multiplayer".pressed.connect(func():
		var game = preload("res://scenes/game.tscn")
		var game_instance = game.instantiate()
		var paddle2 = game_instance.get_node("paddle2")
		paddle2.set_script(preload("res://scripts/paddle_2_multiplayer.gd"))
		var ball = game_instance.get_node("ball")
		ball.player_2 = 'Player 2'
		
		get_tree().root.add_child(game_instance)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = game_instance
	)
