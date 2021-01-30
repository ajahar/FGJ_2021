extends Node

onready var player: KinematicBody = $Player
onready var camera: Camera = $Camera
onready var ball: RigidBody = $Ball

var camera_distance: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	camera_distance = player.transform.origin + camera.transform.origin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.transform = player.transform
	camera.translate(camera_distance)
	camera.look_at(player.transform.origin, Vector3.UP)
	
func _physics_process(delta):
	var movement = Vector3.ZERO
	if Input.is_action_pressed("forward"):
		movement += -player.transform.basis.z
	if Input.is_action_pressed("right"):
		player.rotate(Vector3.UP, deg2rad(-5))
	if Input.is_action_pressed("left"):
		player.rotate(Vector3.UP, deg2rad(5))

	if movement.length() > 0:
		player.move_and_slide(movement * 5, Vector3.UP)
		
