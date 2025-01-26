extends Panel


@export var positive_upgrade:MegaUpgrage


func _add_new_mega(mega:MegaUpgrage)->void:
	positive_upgrade = mega
	positive_upgrade._init_mega()
	$positive.text = positive_upgrade.name_of_the_mega

func _on_button_pressed() -> void:
	positive_upgrade._apply_change(StockerRef.player)
	LevelUpMenu._custom_hide()
