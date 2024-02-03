extends Node


var level_index = 0
var levels: PackedStringArray = [
	'res://levels/level0.tscn',
	'res://levels/level1.tscn',
	'res://levels/level2.tscn',
	'res://levels/level3.tscn',
	'res://levels/level4.tscn',
]


func _ready() -> void:
	get_tree().paused = false
	await get_tree().process_frame
	get_tree().paused = true


func next() -> void:
	level_index += 1
	if level_index >= levels.size(): return
	var level := levels[level_index]
	get_tree().change_scene_to_file(level)


func _process(delta: float) -> void:
		var cam = get_viewport().get_camera_2d()
		if cam:
			cam.process_mode = Node.PROCESS_MODE_ALWAYS


func restart() -> void:
	get_tree().reload_current_scene()
	get_tree().paused = false
	await get_tree().process_frame
	get_tree().paused = true


func win() -> void:
	pass


func play() -> void:
	get_tree().paused = false
