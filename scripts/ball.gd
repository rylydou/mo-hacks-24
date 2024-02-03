class_name Ball extends RigidBody2D


@export var radius := 8.0;
@export var mass_factor := 1.0
@export var snow_grow_factor := 9.0
@onready var snow_grow_rate := 1.0 / pow(2, snow_grow_factor)


@onready var collision: CollisionShape2D = %'Collision'
@onready var circle_shape: CircleShape2D = collision.shape
@onready var sprite: Node2D = %'Sprite'


func _physics_process(delta: float) -> void:
	var is_on_surface = clamp(get_contact_count(), 0, 1)
	radius += snow_grow_rate * linear_velocity.length() * is_on_surface
	set_radius(radius)


func set_radius(radius: float) -> void:
	circle_shape.radius = radius
	mass = (PI * radius ** 2) * mass_factor
	sprite.scale = Vector2.ONE * (radius / 8.0)
