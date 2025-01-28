extends BaseEnemy

var direction:Vector2 = Vector2.ZERO
func _move(delta:float)->void:
	if direction == Vector2.ZERO:
		direction = get_direction()
	current_acceleration = lerp(current_acceleration,max_acceleration,delta)
	global_position += direction*speed*current_acceleration*delta
