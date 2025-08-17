extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : int
var p_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move paddle towards ball
	ball_pos = $"../ball".position
	dist = position.y - ball_pos.y
	
	if abs(dist) >  400 * delta:
		move_by = 400 * delta * (dist / abs(dist))
	else:
		move_by = dist

	position.y -= move_by
	
	#limit paddle movement to window
	position.y = clamp(position.y, 40, 608)
