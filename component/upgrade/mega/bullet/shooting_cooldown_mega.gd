extends MegaUpgrage

class_name MegaShootingCoolDown

var cooldown:float = 0.8

func _init_mega()->void:
	name_of_the_mega = "reduce the shooting cooldown by " + str(int(1-cooldown)*100)
	
func _apply_change(target:Node)->void:
	if target is Player:
		target.shooting_cooldown *= cooldown
