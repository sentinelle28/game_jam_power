extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StockerRef._set_bullet_stocker($bullet_stocker)
	StockerRef._set_player($player)
	Taskmanager.connect("gen_new_task",_update_task_display)
	Taskmanager._gen_new_task()
	EventListener.connect("task_update",_update_task_display)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Bullet:
		area.call_deferred("queue_free")
		EventListener.emit_signal("player_miss")

func _update_task_display()->void:
	for i:int in range(3):
		var label:Label = $task_stocker.get_child(i)
		var current_task:TaskStrategyPattern = Taskmanager.current_task[i]
		label.text = current_task.name
		label.text += " ("
		label.text += current_task.name_of_the_reward
		label.text += ")"

"""
func _process(_delta: float) -> void:
	$Label.set_text("FPS %d" % Engine.get_frames_per_second())"""
