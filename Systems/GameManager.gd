extends Node

signal gui_level_clear
signal gui_game_over

var audio

var player
var ball

var game_timer = 0.0
var time_left = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_timer += delta
	
	if game_timer > 1.0:
		game_timer = 0.0
		if time_left != 0:
			time_left -= 1
		else:
			pass
	
	if time_left == 0:
		game_over()


func goal_reached():
	emit_signal("gui_level_clear", "Level clear!")

func game_over():
	emit_signal("gui_game_over")

func reset_ball():
	# Shit reset, hopefully doesn't fuck player over
	ball.transform.origin = player.transform.origin + Vector3(5,5,2)
