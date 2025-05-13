extends Node3D

var can_talk = false
@onready var prompt = $InteractWithNPC/TalkPrompt
@onready var dialogue_panel = $UI/DialoguePanel
@onready var dialogue_label = $UI/DialoguePanel/RichTextLabel


func _ready():
	var npc_area = $NPC/Area3D
	npc_area.connect("player_entered", _on_player_near)
	npc_area.connect("player_exited", _on_player_leave)
	dialogue_panel.visible = false
	prompt.visible = false

func _on_player_near():
	prompt.visible = true
	can_talk = true

func _on_player_leave():
	prompt.visible = false
	can_talk = false
