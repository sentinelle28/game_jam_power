extends CanvasLayer


func _change_scene(new_scene:String):
	get_tree().paused = true
	show()
	$AnimationPlayer.play("transition")
	await get_tree().create_timer(0.7).timeout
	get_tree().change_scene_to_file(new_scene)
	get_tree().paused = false
	hide()
