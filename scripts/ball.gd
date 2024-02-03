class_name Ball extends RigidBody2D


@export var mass_factor := 1.0
@export var snow_grow_rate := 5.0


@onready var collision: CollisionShape2D = %'Collision'
@onready var circle_shape: CircleShape2D = collision.shape
@onready var sprite: Node2D = %'Sprite'


func _physics_process(delta: float) -> void:
	snow_grow_rate


func set_radius(radius: float) -> void:
	circle_shape.radius = radius
	mass = (PI * radius ** 2) * mass_factor
	sprite.scale = Vector2.ONE * (radius / 8.0)
