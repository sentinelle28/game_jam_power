extends MegaUpgrage

class_name MegaDefenseUpgrade

var damage_reduction:float = 0.80

func _init_mega()->void:
	name_of_the_mega = "Reduce incoming damage by " 
	name_of_the_mega += str((1-damage_reduction)*100)
	name_of_the_mega += "%"
	
func _apply_change(target:Node)->void:
	if target is Player:
		target.health_component.damage_reduction *= damage_reduction
