extends AudioStreamPlayer2D

const over = preload("res://assets/over.mp3")

func _ready() -> void:
	$".".stream = over
	$".".play()
