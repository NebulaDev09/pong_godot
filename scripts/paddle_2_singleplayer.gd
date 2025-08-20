extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : int
var p_height : int

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

func _process(delta):
	ball_pos = $"../ball".position
	dist = position.y - ball_pos.y
	
	if abs(dist) >  400 * delta:
		move_by = 400 * delta * (dist / abs(dist))
	else:
		move_by = dist

	position.y -= move_by
	
	position.y = clamp(position.y, 40, 608)
