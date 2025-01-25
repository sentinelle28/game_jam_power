extends CanvasLayer

signal update_stats(updrade:UpgradeStrategyPattern)

func _custom_show()->void:
	show()
	get_tree().paused = true
	$upgrade_card._randomize()
	$upgrade_card2._randomize()
	$upgrade_card3._randomize()
	
func _custom_hide():
	hide()
	get_tree().paused = false
