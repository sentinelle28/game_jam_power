extends Node2D


var current_frame:int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("tutorial")
	$AnimationPlayer.speed_scale = 0
	StockerRef.bullet_stocker = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		current_frame += 1
		$AnimationPlayer.seek(float(current_frame)/10.0)
		if current_frame == 3:
			Taskmanager._gen_new_task()
			TaskOverlay.show()
		elif current_frame == 4:
			$AnimationPlayer.speed_scale = 1
			


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scene/gameplay_scene/gameplay_scene.tscn")
