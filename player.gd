extends CharacterBody3D

@export var speed = 5.0

func _physics_process(delta):
	var input_dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	var direction = Vector3(input_dir.x, 0, input_dir.y)
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
