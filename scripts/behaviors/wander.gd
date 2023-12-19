extends SteeringBehavior
class_name Wander

func calculate_desired_velocity(_self:Vehicle, _target = null):
	_self.steering_angle += randf_range(-15,15)

	var theta = deg_to_rad(_self.steering_angle) + _self.velocity.angle()
	var desired_velocity = (_self.velocity.normalized() * _self.max_speed * _self.circ_dist)
	desired_velocity.x += _self.circ_r * cos(theta)
	desired_velocity.y += _self.circ_r * sin(theta)
	return desired_velocity.limit_length(_self.max_speed)
	#return _self.transform.y * _self.circ_dist + Vector2(_self.circ_r,0).rotated(.01)
	#return desired_velocity
