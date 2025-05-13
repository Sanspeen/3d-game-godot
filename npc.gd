extends CharacterBody3D

@export var patrol_distance = 3.0
@export var speed = 2.0

var direction = 1
var start_position = Vector3.ZERO

func _ready():
	start_position = global_transform.origin

func _physics_process(delta):
	var offset = global_transform.origin - start_position
	if abs(offset.x) > patrol_distance:
		direction *= -1
	velocity = Vector3(direction * speed, 0, 0)
	move_and_slide()
