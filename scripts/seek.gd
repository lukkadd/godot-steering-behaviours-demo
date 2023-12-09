extends SteeringBehavior
class_name Seek

func calculate_desired_velocity(_self:Vehicle, _target):
	var desired_velocity = (_target if _target is Vector2 else _target.position) - _self.position
	desired_velocity = desired_velocity.limit_length(_self.max_speed)
	return desired_velocity
