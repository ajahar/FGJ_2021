extends Control


onready var tutorial1: TextureRect = $"1"
onready var tutorial2: TextureRect = $"2"
onready var tutorial3: TextureRect = $"3"
onready var tutorial4: TextureRect = $"4"

var tutorial_index = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("ui_accept"):
		if tutorial_index == 1:
			tutorial1.visible = false
			tutorial2.visible = true
			tutorial_index += 1
		elif tutorial_index == 2:
			tutorial2.visible = false
			tutorial3.visible = true
			tutorial_index += 1
		elif tutorial_index == 3:
			tutorial3.visible = false
			tutorial4.visible = true
			tutorial_index += 1
		elif tutorial_index == 4:
			GameManager.audio.start_music()
			get_tree().change_scene("res://GameScenes/Level.tscn")

