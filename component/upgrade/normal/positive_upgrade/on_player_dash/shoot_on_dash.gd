extends OnPlayerDash


class_name ShootOnDash

func _apply_custom(target:Player)->void:
	var direction:Vector2 = Vector2(randi_range(-1,1),randi_range(-1,1))
	target._shoot_toward(direction)
