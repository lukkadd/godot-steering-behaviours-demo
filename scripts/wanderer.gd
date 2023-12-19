extends Vehicle

@onready var circ_dist = 100
@onready var circ_r = 50 
@onready var circ_pos = Vector2(0,circ_dist)
@onready var steering_angle = 0

func _process(delta):
	queue_redraw()

func get_desired_velocity():
	if steering_behavior != null:
		return steering_behavior.calculate_desired_velocity(self)
	return Vector2.ZERO

func _draw():
	var inv = get_global_transform().inverse()
	draw_set_transform(inv.get_origin(), inv.get_rotation(), inv.get_scale())
	var theta = deg_to_rad(steering_angle) + velocity.angle()
	var circ_pos = position + velocity.normalized() * circ_dist
	
	draw_arc(circ_pos, circ_r, 0, 360, 360, Color.CHARTREUSE )
	draw_line(position, circ_pos ,Color.BROWN)
	draw_line(circ_pos, circ_pos + Vector2(circ_r * cos(theta), circ_r * sin(theta)) ,Color.VIOLET)
	
func screen_wrap():
	if position.x > screen_size.x:
		position.x = 0
	elif position.x < 0:
		position.x = screen_size.x
	elif position.y > screen_size.y:
		position.y = 0
	elif position.y < 0:
		position.y = screen_size.y
