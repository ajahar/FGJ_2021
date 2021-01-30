extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.audio = self
	play_new_game()
	start_music()
	
func start_music():
	$Music.play()
	
func stop_music():
	$Music.stop()
	
func play_new_game():
	$Open.play()

func play_victory():
	$Victory.play()
