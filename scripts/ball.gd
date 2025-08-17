extends CharacterBody2D

var win_size : Vector2
var start_speed = 500
var speed
var accelaration = 50
var dir : Vector2
var score = [0, 0]

func _ready() -> void:
	win_size = get_viewport_rect().size
	speed = start_speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		var collider = collision.get_collider()
		if collider == $"../paddle1" or collider == $"../paddle2":
			speed += accelaration
			dir = new_direction(collider)
		else:
			dir = dir.bounce(collision.get_normal())
			
func check_winner():
	if score[1] == 1:
		get_tree().change_scene_to_file("res://scenes/winner2.tscn")
	elif score[0] == 1:
		get_tree().change_scene_to_file("res://scenes/winner1.tscn")

func newBall():
	speed = start_speed
	position.x = win_size.x/2
	position.y = win_size.y/2
	dir.x = [-1, 1].pick_random()
	dir.y = randf_range(-1, 1)
	dir = dir.normalized()

func _on_timer_timeout() -> void:
	newBall()

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var d = ball_y - pad_y
	var new_dir := Vector2()
	
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
		
	new_dir.y = d / ($"../paddle1/ColorRect".size.y)
	
	return new_dir.normalized()

func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	check_winner()
	$"../scores/left".text = str(score[1])
	$"../Timer".start()


func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	check_winner()
	$"../scores/right".text = str(score[0])
	$"../Timer".start()
