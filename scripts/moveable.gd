class_name Movable extends Node


var is_moving = false
var is_rotating = false
var move_offset: Vector2


@onready var object: CollisionObject2D = get_parent()


func _ready() -> void:
	object.input_event.connect(_input_event)
	object.process_mode = Node.PROCESS_MODE_WHEN_PAUSED


func _process(delta: float) -> void:
	if is_moving:
		object.global_position = object.get_global_mouse_position() + move_offset
	
	if is_rotating:
		object.look_at(object.get_global_mouse_position())


func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var mouse_btn := event as InputEventMouseButton
	if mouse_btn and event.is_pressed():
		if mouse_btn.button_index == MOUSE_BUTTON_LEFT:
			is_moving = true
			move_offset = object.global_position - object.get_global_mouse_position()
			return
		if mouse_btn.button_index == MOUSE_BUTTON_RIGHT:
			is_rotating = true
			return


func _input(event: InputEvent) -> void:
	var mouse_btn := event as InputEventMouseButton
	if mouse_btn and event.is_released():
		if mouse_btn.button_index == MOUSE_BUTTON_LEFT:
			is_moving = false
		if mouse_btn.button_index == MOUSE_BUTTON_RIGHT:
			is_rotating = false
