extends Camera

export(NodePath) var target_node
export(float) var camera_distance = 8

var camera_dir: Vector3
var target: Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node(target_node)
	camera_dir = (target.transform.origin + self.transform.origin).normalized()
	camera_dir *= camera_distance


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.transform = target.transform
	self.translate(camera_dir)
	self.look_at(target.transform.origin, Vector3.UP)
