extends Spatial

onready var collider: RigidBody = $RigidBody

var ball_detected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	collider.connect("body_entered", self, "hit_robot")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hit_robot(body):
	if body.name == "Ball" and !ball_detected:
		ball_detected = true
		print("Robo detects the ball")
		# TODO: Spit out a treat
