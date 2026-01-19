extends Control

@onready var introduction: Panel = $introduction
@onready var name_input: LineEdit = $introduction/VBoxContainer/name_container/name_input
@onready var team_select: OptionButton = $introduction/VBoxContainer/team_container/team_select
@onready var confirm_btn: Button = $introduction/VBoxContainer/confirm_btn

var team_list: Array = []

func _ready() -> void:
	_generate_list()
	_add_to_options()
	
	
func _generate_list() -> Array:
	var squad_name = Big6.PLAYER_INFORMATION
	
	for items in squad_name:
		if not team_list.has(items['Squad']):
			team_list.append(items['Squad'])
	return team_list

func _add_to_options() -> void:
	for items in team_list:
		team_select.add_item(items)


func _on_confirm_btn_pressed() -> void:
	Global.USER_INFORMATION['NAME'] = name_input.text
	
