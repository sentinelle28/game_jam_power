extends Panel


@export var positive_upgrade:MegaUpgrage

func _ready() -> void:
	_randomize()

func _randomize()->void:
	positive_upgrade = UpgradeRef.get_random_mega()
	positive_upgrade._init_mega()
	$positive.text = positive_upgrade.name_of_the_mega

func _on_button_pressed() -> void:
	positive_upgrade._apply_change(StockerRef.player)
	LevelUpMenu._custom_hide()
