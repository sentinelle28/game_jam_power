extends Node2D


var current_frame:int = 0
var is_locked:bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Taskmanager.connect("gen_new_task",_on_task_finish)
	$AnimationPlayer.play("tutorial")
	$AnimationPlayer.speed_scale = 0
	StockerRef.bullet_stocker = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	match current_frame:
		0:
			if Input.get_vector("ui_left","ui_right","ui_up","ui_down") != Vector2.ZERO:
				current_frame += 1
		
		2:
			if Input.is_action_just_pressed("dash"):
				current_frame += 1
		3:
			if not is_locked:
				
				Taskmanager._gen_new_task()
				TaskOverlay.show()
				is_locked = true
		4:
			$AnimationPlayer.speed_scale = 1
	if current_frame < 4:
		$AnimationPlayer.seek(float(current_frame)/10.0)
	if Input.is_action_just_pressed("shoot"):
		current_frame += 1


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scene/gameplay_scene/gameplay_scene.tscn")

func _on_task_finish()->void:
	if is_locked:
		current_frame += 1
