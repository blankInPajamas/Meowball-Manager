extends Node

var card_being_dragged: Node2D = null
var CURRENT_PLAYER_NAME: String = ''
var CURRENT_PLAYER_RANKING: float = 0.0
var PLAYER_LOCATION: String = 'res://data/big6_data.json'
var DATA = null

func load_player_data() -> void:
	var file = FileAccess.open(PLAYER_LOCATION, FileAccess.READ).get_as_text()
	DATA = JSON.parse_string(file)
	print("File loaded")
	
func _ready() -> void:
	load_player_data()
