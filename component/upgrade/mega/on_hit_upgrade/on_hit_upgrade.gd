extends MegaUpgrage

class_name OnPlayerHitUpgrade
var is_in_player:bool = false

func _apply_change(target:Node)->void:
	if target is Player:
		_init_upgrade(target)
		_apply_custom(target)
		
func _apply_custom(target:Player)->void:
	pass
		
	
func _init_upgrade(target:Player)->void:
	if not is_in_player:
		var new_upgrade:OnPlayerHitUpgrade = self.duplicate()
		new_upgrade.is_in_player = true
		target.on_player_hit_upgrade.append(new_upgrade)
