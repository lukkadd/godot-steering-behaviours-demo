extends SteeringBehavior

func calculate_desired_velocity(_self:Vehicle, _target: Variant):
	var desired_velocity
	const T = 5
	if _target is Vehicle:
		desired_velocity = (_target.position + (_target.velocity * T)) - _self.position
	else:
		desired_velocity = _target.position - _self.position
	desired_velocity = desired_velocity.limit_length(_self.max_speed)
	return -desired_velocity
