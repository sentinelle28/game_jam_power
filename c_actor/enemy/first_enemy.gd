extends BaseEnemy

class_name FirstEnemy
func _move(delta:float)->void:
	current_acceleration = lerp(current_acceleration,max_acceleration,delta)
	global_position += get_direction()*speed*current_acceleration*delta

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		call_deferred("queue_free")
