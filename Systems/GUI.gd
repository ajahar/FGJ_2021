extends MarginContainer

onready var time_left: Label = get_node("Panel/TimeLeftLabel")
onready var game_over_label: Label = get_node("Panel/GameOver")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("gui_game_over", self, "on_game_over")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time_left.set_text("Time left: %s" % GameManager.time_left)

func _on_Restart_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Quit_pressed():
	get_tree().quit()

func on_game_over():
	game_over_label.visible = true
