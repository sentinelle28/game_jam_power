extends MegaUpgrage

class_name MegaHealthRecoveryUpgrade

var hp_recover_by_second:float = 1.0

func _init_mega()->void:
	name_of_the_mega = "Passively recover "
	name_of_the_mega += str(hp_recover_by_second)
	name_of_the_mega += " hp/s"
	
func _apply_change(target:Node)->void:
	if target is Player:
		target.health_component.regen += 1.0
		target.health_component._start_regen()
		
