extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TaskOverlay.hide()


func _on_button_pressed() -> void:
	AudioController._play("click")
	SceneTransition._change_scene("res://scene/gameplay_scene/gameplay_scene.tscn")


func _on_button_2_pressed() -> void:
	AudioController._play("click")
	SceneTransition._change_scene("res://scene/tutorial/tutorial.tscn")
