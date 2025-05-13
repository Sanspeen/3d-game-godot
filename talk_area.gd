extends Area3D

signal player_entered
signal player_exited
var player_in_range = false

func _on_talk_area_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		player_in_range = true


func _on_talk_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		player_in_range = false

var dialogue_open = false

func start_dialogue():
	dialogue_open = true
	# Detener movimiento del NPC (si aplica)
	if has_node("NavigationAgent3D"):
		$NavigationAgent3D.set_velocity(Vector3.ZERO)

	# Mostrar diálogo
	var dialogue = get_tree().root.get_node("main/UI/DialoguePanel")
	dialogue.visible = true
	dialogue.get_node("RichTextLabel").text = "No se que quieres, vete! \n [presiona 'Q' para cerrar]"

func end_dialogue():
	dialogue_open = false
	var dialogue = get_tree().root.get_node("main/UI/DialoguePanel")
	dialogue.visible = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		start_dialogue()
	elif Input.is_action_just_pressed("close_interact") and dialogue_open:
		end_dialogue()
