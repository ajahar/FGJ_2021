extends KinematicBody

onready var stomp_timer: Timer = $StompTimer
onready var mesh: Spatial = $pupu

const MOVEMENT_SPEED = 8
const ROTATION_SPEED = 5

var stomping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.player = self
	stomp_timer.connect("timeout", self, "stomp_timeout")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("stomp") and !stomping:
		print("stomping")
		stomp_timer.start()
		stomping = true
	
	if stomping:
		mesh.transform.origin = Vector3(0,rand_range(0.5, 3),0)


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
		

func stomp_timeout():
	stomping = false
	mesh.transform.origin = Vector3(0,0,0)
	print("stomped very hard")
	# TODO: Call human?
	GameManager.reset_ball()
	

	
