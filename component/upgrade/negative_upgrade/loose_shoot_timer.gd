extends UpgradeStrategyPattern

class_name NegativeShootTimer
func _apply_change(target:Node)->void:
	if target is Player:
		target.shooting_cooldown *= 1.1
