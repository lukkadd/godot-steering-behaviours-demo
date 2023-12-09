extends Resource
class_name SteeringBehavior

var behavior_name

func _init():
	behavior_name = 'Idle'

func calculate_desired_velocity(_self:Vehicle, _target: Variant) -> Vector2:
	return Vector2.ZERO
