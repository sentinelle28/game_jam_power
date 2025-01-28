extends BaseEnemy

class_name FirstEnemy
func _move(delta:float)->void:
	current_acceleration = lerp(current_acceleration,max_acceleration,delta)
	global_position += get_direction()*speed*current_acceleration*delta
