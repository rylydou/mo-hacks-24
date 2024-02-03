extends Node


var level_index = 0
var levels: PackedStringArray = [
	'res://levels/test_level.tscn',
]


func _ready() -> void:
	get_tree().paused = false
	await get_tree().process_frame
	get_tree().paused = true
	get_viewport().get_camera_2d().process_mode = Node.PROCESS_MODE_ALWAYS


func next() -> void:
	level_index += 1
	if level_index >= levels.size(): return
	var level := levels[level_index]
	get_tree().change_scene_to_file(level)
	%'Next Button'.disabled = true
	get_viewport().get_camera_2d().process_mode = Node.PROCESS_MODE_ALWAYS


func restart() -> void:
	get_tree().reload_current_scene()
	get_tree().paused = false
	await get_tree().process_frame
	get_tree().paused = true


func win() -> void:
	pass


func play() -> void:
	get_tree().paused = false
