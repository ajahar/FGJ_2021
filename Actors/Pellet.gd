extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "hit_pellet")
	self.apply_central_impulse(-Vector3.FORWARD * 10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hit_pellet(body):
	if body.name == "Player":
		print("Hit Pellet")
