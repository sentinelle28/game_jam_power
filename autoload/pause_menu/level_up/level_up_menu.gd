extends CanvasLayer

signal update_stats(name_of_teh:StringName,value)

func _custom_show()->void:
	show()
	get_tree().paused = true
	
	


func _on_button_pressed() -> void:
	hide()
	get_tree().paused = false
	emit_signal("update_stats","speed",100)
