extends HealthUpgrade

class_name NegativeMaxHealthUpgrade
func _apply_change(target:Node)->void:
	if target is HealthComponent:
		target._update_max_health(target.max_health - health_value)
