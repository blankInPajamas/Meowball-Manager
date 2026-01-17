extends Control

signal request_close

@onready var player_name: RichTextLabel = $"Panel/Detail Container/VBoxContainer/Player name"
@onready var squad: RichTextLabel = $"Panel/Detail Container/VBoxContainer/Squad"
@onready var player_position: RichTextLabel = $"Panel/Detail Container/VBoxContainer/Position"
@onready var nation: RichTextLabel = $"Panel/Detail Container/VBoxContainer/Nation"
@onready var age: RichTextLabel = $"Panel/Detail Container/VBoxContainer/Age"
@onready var goals: RichTextLabel = $"Panel/Detail Container/VBoxContainer/Goals"
@onready var assists: RichTextLabel = $"Panel/Detail Container/VBoxContainer/Assists"

func _on_back_btn_pressed() -> void:
	request_close.emit()
	queue_free()

func _setup_player_information(p_name: String, p_squad: String) -> void:
	player_name.text = "Name: " + p_name
	squad.text = "Squad: " + p_squad
	#print("Reaching this section")
	
	if Global.DATA:
		for p in Global.DATA:
			if p["Player"] == p_name and p["Squad"] == p_squad:
				print(p)
				_populate_ui(p)
		

func _populate_ui(p: Dictionary) -> void:
	player_position.text = ("Position: " + p['Pos'])
	nation.text = ("Nation: " + p['Nation'])
	age.text = ("Age: " + str(p['Age']))
	goals.text = ("Goal count: " + str(p['Gls']))
	assists.text = ("Assist count: " + str(p['Ast']))
	
