extends Node

signal update_message

var audio


var game_timer = 0.0
export var play_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_timer += delta
	
	if game_timer > 1.0:
		game_timer = 0.0
		play_time += 1


func goal_reached():
	if audio != null:
		audio.play_victory()
	emit_signal("gui_level_clear", "Level clear!")

func game_over():
	if audio != null:
		audio.play_mouse_death()
	emit_signal("gui_game_over", "Game over")
