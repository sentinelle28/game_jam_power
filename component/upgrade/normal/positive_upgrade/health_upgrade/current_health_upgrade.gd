extends HealthUpgrade

class_name CurrentHealthUpgrade
func _apply_change(target:Node)->void:
	if target is HealthComponent:
		target.health += health_value
		target.health = clampi(target.health,0,target.max_health)
