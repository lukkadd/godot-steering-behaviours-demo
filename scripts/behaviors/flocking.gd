extends SteeringBehavior
class_name Flocking

func calculate_desired_velocity(_self:Vehicle, _target = null):
	var neighbors = _self.perception.get_overlapping_areas()
	var nNeighbors = neighbors.size() 
	nNeighbors = nNeighbors if nNeighbors > 0 else 1
	var desired = Vector2.ZERO
	
	var align_vel = _self.velocity
	var cohesion_vel = _self.position
	var separation_vel = Vector2.ZERO
	
	for boid in neighbors:
		var boidNode = boid.get_parent()
		if boid != _self.clickArea:
			#alignment
			align_vel += boidNode.velocity
			#cohesion
			cohesion_vel += boidNode.position
			#separation
			var diff = _self.position - boidNode.position
			separation_vel += diff.normalized() / diff.length()
			
	align_vel /= nNeighbors
	cohesion_vel /= nNeighbors
	separation_vel /= nNeighbors
	
	if(_self.separation):
		desired += separation_vel.normalized()
	if(_self.alignment):
		desired += align_vel.normalized()
	if(_self.cohesion):
		desired += (cohesion_vel - _self.position).normalized()
	desired = desired.normalized() * _self.max_speed
	return desired if desired.length() != 0 else _self.velocity
