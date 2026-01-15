extends Node2D

@export var player_name: String = ""
@export var squad: String = ""
@onready var detail_area: CanvasLayer = $"Card Details"
var dragging: bool = false
var mouse_offset: Vector2 = Vector2.ZERO
var drag_tween: Tween


func _ready() -> void:
	detail_area.visible = false


func _process(delta: float) -> void:
	#_hide_panel() # Hides the detailed information panel
	
	if dragging:
		var target_pos: Vector2 = get_global_mouse_position() + mouse_offset
		
		if drag_tween and drag_tween.is_valid():
			drag_tween.kill()
			drag_tween = null
		
		drag_tween = create_tween()
		drag_tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		drag_tween.tween_property(self,"global_position",target_pos, 0.04)


func _on_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				#detail_area.visible = false
				if Global.card_being_dragged == null:
					Global.card_being_dragged = self
					dragging = true
					mouse_offset = global_position - get_global_mouse_position()

			else:
				dragging = false
				if Global.card_being_dragged == self:
					Global.card_being_dragged = null
				if drag_tween and drag_tween.is_valid():
					drag_tween.kill()
					drag_tween = null
					
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			detail_area.visible = true


func _hide_panel() -> void:
	if Input.is_action_pressed("ui_accept") and detail_area.visible:
		detail_area.visible = false


func _on_drag_released() -> void:
	pass


func _on_back_btn_pressed() -> void:
	detail_area.visible = false
