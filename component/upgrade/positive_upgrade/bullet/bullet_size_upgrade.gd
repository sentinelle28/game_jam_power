extends BulletUpgrade
class_name BulletSizeUpgrade
func _apply_change(target:Node)->void:
	if target is Player:
		target.bullet_size *= 1.2
