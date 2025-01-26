extends BulletUpgrade
class_name BulletPierceUpgrade
func _apply_change(target:Node)->void:
	if target is Player:
		target.bullet_pierce += 1
