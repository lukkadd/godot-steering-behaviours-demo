extends SteeringBehavior
class_name Flee

func calculate_desired_velocity(_self:Vehicle, _target = null):
	var desired_velocity = (_target if _target is Vector2 else _target.position) - _self.position
	if desired_velocity.length() == 0:
		desired_velocity.x = 1
	desired_velocity = desired_velocity * _self.max_speed
	desired_velocity = desired_velocity.limit_length(_self.max_speed)
	return -desired_velocity
