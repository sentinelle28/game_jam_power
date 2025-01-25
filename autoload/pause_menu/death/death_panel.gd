extends CanvasLayer

signal player_is_dead
signal reset

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("player_is_dead",_custom_show)


func _custom_show()->void:
	
	get_tree().paused = true
	$Panel/VBoxContainer/Label.text = "You were level " + str(PlayerXp.level)
	#$Panel/VBoxContainer/Label2.text = "You survive  " + str(PlayerXp.number_of_kill)
	$Panel/VBoxContainer/Label3.text = "You killed " + str(PlayerXp.number_of_kill)
	print("receive")
	show()
	


func _on_button_pressed() -> void:
	hide()
	get_tree().paused = false
	PlayerXp._reset()
	emit_signal("reset")
