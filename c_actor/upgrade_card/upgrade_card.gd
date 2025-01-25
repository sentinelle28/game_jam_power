extends Panel


@export var positive_upgrade:UpgradeStrategyPattern
@export var negative_upgrade:UpgradeStrategyPattern

@export var positive_text:String
@export var negative_text:String

func _ready() -> void:
	_randomize()

func _randomize()->void:
	positive_text = UpgradeRef.get_random_positive_upgrade()
	negative_text = UpgradeRef.get_random_negative_upgrade()
	positive_upgrade = UpgradeRef.get_positive_upgrade(positive_text)
	negative_upgrade = UpgradeRef.get_negative_upgrade(negative_text)
	$VBoxContainer/positive.text = positive_text
	$VBoxContainer/negative.text = negative_text

func _on_button_pressed() -> void:
	LevelUpMenu.emit_signal("update_stats",positive_upgrade)
	LevelUpMenu.emit_signal("update_stats",negative_upgrade)
	LevelUpMenu._custom_hide()
