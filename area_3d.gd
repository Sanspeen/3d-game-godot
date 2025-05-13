extends Area3D

signal player_entered
signal player_exited

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal("player_entered")
		print("Entro en rango")
		

func _on_body_exited(body):
	if body.name == "Player":
		emit_signal("player_exited")
		print("Salio de rango")
