extends HealthUpgrade

class_name MaxHealthUpgrade
func _apply_change(target:Node)->void:
	var n_target:HealthComponent
	if target is Player:
		n_target = target.health_component
		
	if target is HealthComponent:
		n_target = target
		n_target._update_max_health(n_target.max_health + health_value)
