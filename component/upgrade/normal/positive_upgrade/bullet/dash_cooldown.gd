extends UpgradeStrategyPattern
class_name DashCooldown
func _apply_change(target:Node)->void:
	if target is Player:
		target.dash_recovery *= 0.9
