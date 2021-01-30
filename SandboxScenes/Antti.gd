extends Node

onready var player: KinematicBody = $Player
onready var ball: RigidBody = $Ball
onready var pellet: RigidBody = $Pellet
onready var output: Label = $Output

var hit_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pellet.connect("body_entered", self, "hit_pellet")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	

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
	
func hit_pellet(body):
	if body.name == "Player":
		hit_count += 1 
		output.set_text("Hit Pellet: %s" % hit_count)
		print("Hit Pellet")
