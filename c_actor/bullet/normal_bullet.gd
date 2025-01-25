extends Bullet

func _move(delta: float)->void:
	current_acceleration = lerp(current_acceleration,max_acceleration,delta)
	global_position += direction*speed*current_acceleration*delta
	
