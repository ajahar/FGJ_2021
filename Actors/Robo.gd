extends RigidBody

export(PackedScene) var pellet_scene

onready var spawn_point: Spatial = $SpawnPoint

var ball_detected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "hit_robot")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hit_robot(body):
	if body.name == "Ball" and !ball_detected:
		print("Robo detects the ball")
		ball_detected = true
		var pellet = pellet_scene.instance()
		get_tree().get_root().add_child(pellet)
		pellet.transform.origin = spawn_point.global_transform.origin

