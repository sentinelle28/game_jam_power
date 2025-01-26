extends UpgradeStrategyPattern

class_name NegativeSpeedUpgrade
func _apply_change(target:Node)->void:
	if target is Player:
		target.speed -= 10
