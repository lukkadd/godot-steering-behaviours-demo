extends Node2D
class_name Vehicle

@onready var sprite = $Sprite2D
@onready var screen_size = get_viewport_rect().size

@export var steering_behavior: SteeringBehavior
@export var target:Node2D

@export var max_speed = 10
@export var max_force = 1
@export var mass = 1
@onready var velocity = Vector2(0,0)

signal right_clicked(node)

func screen_wrap():
	position.x = clampf(position.x, 0, screen_size.x)
	position.y = clampf(position.y, 0, screen_size.y)

func _physics_process(delta):
	
	var desired_velocity = Vector2.ZERO
	if steering_behavior != null:
		if target:
			desired_velocity = steering_behavior.calculate_desired_velocity(self, target)
		else:
			desired_velocity = steering_behavior.calculate_desired_velocity(self, get_global_mouse_position())
		
	var steering_force = mass * (desired_velocity - velocity)
	steering_force = steering_force.limit_length(max_force)
	
	velocity += steering_force / mass
	
	position += velocity
	
	sprite.rotation = velocity.angle() + (PI/2)
	screen_wrap()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			get_viewport().set_input_as_handled()
			emit_signal("right_clicked", self)
