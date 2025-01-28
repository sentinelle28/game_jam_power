extends CanvasLayer


func _custom_show()->void:
	show()
	get_tree().paused = true
	var to_send:Array[MegaUpgrage] = UpgradeRef.get_random_megas()
	
	$upgrade_card._add_new_mega(to_send[0])
	$upgrade_card2._add_new_mega(to_send[1])
	$upgrade_card3._add_new_mega(to_send[2])
	
func _custom_hide():
	AudioController._play("mega")
	hide()
	get_tree().paused = false
	EnvironnementVar._change_difficulty()
