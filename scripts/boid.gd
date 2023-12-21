extends Vehicle
class_name Boid

@onready var perception = $PerceptionArea
@onready var clickArea = $ClickableArea

@onready var separation = true
@onready var alignment = true
@onready var cohesion = true

func screen_wrap():
	if position.x > screen_size.x:
		position.x = 0
	elif position.x < 0:
		position.x = screen_size.x
	elif position.y > screen_size.y:
		position.y = 0
	elif position.y < 0:
		position.y = screen_size.y
