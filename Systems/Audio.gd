extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.audio = self
	#play_new_game()
	#start_music()
	play_tutorial_music()
	
func start_music():
	$Music.play()
	
func stop_music():
	$Music.stop()

func play_tutorial_music():
	$TutorialMusic.play()

func play_new_game():
	$Open.play()

func play_victory():
	$Victory.play()
