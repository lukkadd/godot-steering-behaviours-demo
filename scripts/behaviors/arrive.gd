extends SteeringBehavior
class_name Arrive

var slowing_distance = 100

func calculate_desired_velocity(_self:Vehicle, _target = null):
	# Same as seek
	var target_offset = (_target if _target is Vector2 else _target.position) - _self.position
	
	var distance = target_offset.length()
	if distance == 0:
		distance = 1
	var speed = _self.max_speed * (distance / (_target.arrival_radius if _target is ArrivalTarget else slowing_distance ))
	speed = min(_self.max_speed, speed)
	
	var desired_velocity = (speed / distance) * target_offset
	
	return desired_velocity
