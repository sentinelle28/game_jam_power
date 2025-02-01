extends HealthUpgrade

class_name CurrentHealthUpgrade
func _apply_change(target:Node)->void:
	var n_target:HealthComponent
	if target is Player:
		n_target = target.health_component
	
	if target is HealthComponent:
		n_target = target
		n_target.health += health_value
		n_target.health = clampi(n_target.health,0,n_target.max_health)
