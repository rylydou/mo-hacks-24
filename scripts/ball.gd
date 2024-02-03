class_name Ball extends RigidBody2D


@export var radius := 8.0;
@export var mass_factor := 1.0
@export var snow_grow_factor := 9.0
@onready var snow_grow_rate := 1.0 / pow(2, snow_grow_factor)
@export var pond_shrink_rate := 8.0
@export var air_shrink_rate := 4.0


@onready var collision: CollisionShape2D = %'Collision'
@onready var circle_shape: CircleShape2D = collision.shape
@onready var sprite: Node2D = %'Sprite'


func _physics_process(delta: float) -> void:
	for body in get_colliding_bodies():
		if body.has_meta('snow'):
			radius += snow_grow_rate * linear_velocity.length()
		if body.has_meta('pond'):
			radius -= air_shrink_rate * delta
	
	if radius < 4:
		queue_free()
		return
	set_radius(radius)


func set_radius(radius: float) -> void:
	circle_shape.radius = radius
	mass = (PI * radius ** 2) * mass_factor
	sprite.scale = Vector2.ONE * (radius / 8.0)
