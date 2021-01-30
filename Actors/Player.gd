extends KinematicBody

const MOVEMENT_SPEED = 8
const ROTATION_SPEED = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	var movement = Vector3.ZERO
	if Input.is_action_pressed("forward"):
		movement += -self.transform.basis.z
	if Input.is_action_pressed("right"):
		self.rotate(Vector3.UP, deg2rad(-ROTATION_SPEED))
	if Input.is_action_pressed("left"):
		self.rotate(Vector3.UP, deg2rad(ROTATION_SPEED))

	if movement.length() > 0:
		var collision = self.move_and_collide(movement * MOVEMENT_SPEED * delta)
