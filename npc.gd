extends CharacterBody3D

@export var patrol_distance = 4.0
@export var speed = 2.0

var direction = 1
var start_position = Vector3.ZERO
var can_move = true

func _ready():
	start_position = global_transform.origin

func _physics_process(delta):
	if can_move:
		var offset = global_transform.origin - start_position
		if abs(offset.x) > patrol_distance:
			direction *= -1
		velocity = Vector3(direction * speed, 0, 0)
		move_and_slide()
	else:
		velocity = Vector3.ZERO
		move_and_slide()
