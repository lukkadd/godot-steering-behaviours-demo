extends Vehicle

@onready var collisions = []
@onready var collider = $Collider
@onready var clickColl = $ClickableArea

func get_desired_velocity():
	var steering_vel = super()
	var closest_dist = 0
	var closest_node = null
	var avoidance_steer = Vector2.ZERO
	for col in collider.get_overlapping_areas():
		if col != clickColl:
			var dist = col.get_parent().position.distance_to(position)
			if closest_dist == 0 || dist < closest_dist:
				closest_dist = dist
				closest_node = col.get_parent()
	if(closest_node):
		avoidance_steer = (position - closest_node.position).normalized().orthogonal() * 20
	return steering_vel + avoidance_steer
