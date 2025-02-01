extends BulletUpgrade
class_name NumberShotUpgrade
func _apply_change(target:Node)->void:
	if target is Player:
		target.bullet_to_shoot += 1
