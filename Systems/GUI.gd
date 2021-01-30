extends MarginContainer

onready var play_time: Label = get_node("Panel/PlayTime")
onready var message: Label = get_node("Panel/Message")
onready var end_panel: CanvasItem = get_node("Panel/End")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("update_message", self, "on_update_message")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	play_time.set_text("Time: %s" % GameManager.play_time)

func on_update_message(signal_text):
	message.set_text(signal_text)
	end_panel.visible = true
	

func _on_Restart_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_Quit_pressed():
	get_tree().quit()
