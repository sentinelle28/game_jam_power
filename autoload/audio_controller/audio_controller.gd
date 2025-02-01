extends Node

func _play(name_of_sfx:String)->void:
	match name_of_sfx:
		"hit":
			$hit.play()
		"upgrade":
			$upgrade.play()
		"mega":
			$mega_upgrade.play()
		"shoot":
			$shoot.play()
		"dash":
			$dash.play()
		"enemy shoot":
			$enemy_shoot.play()
		"player hit":
			$player_hit.play()
		"explosion":
			$explosion.play()
		"one hp":
			$one_hp.play()
