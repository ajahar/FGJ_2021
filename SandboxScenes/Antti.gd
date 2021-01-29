extends Node

onready var player: KinematicBody = $Player
onready var camera: Camera = $Camera

var camera_distance: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	camera_distance = player.transform.origin - camera.transform.origin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.transform.origin = player.transform.origin - camera_distance

func _physics_process(delta):
	player.move_and_collide(Vector3.FORWARD * delta * 5)
