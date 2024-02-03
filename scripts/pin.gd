extends RigidBody2D


func _physics_process(delta: float) -> void:
	var dot = Vector2.RIGHT.dot(Vector2.from_angle(rotation))
	if dot < 0.5:
		UI.win()
