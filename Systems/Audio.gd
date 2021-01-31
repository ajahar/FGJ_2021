extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.audio = self
	play_tutorial_music()
	
func start_music():
	$TutorialMusic.stop()
	$Music.play()
	
func stop_music():
	$Music.stop()

func play_tutorial_music():
	$TutorialMusic.play()
