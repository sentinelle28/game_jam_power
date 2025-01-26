extends TaskStrategyPattern

class_name WalkTask

@export var distance_to_walk:float = 5000
func _personal_init()->void:
	name = "Walk " + str(distance_to_walk)
	EventListener.connect("player_walk",_custom_update_task)
	
func _custom_update_task(distance:float)->void:
	distance_to_walk -= distance
	if distance_to_walk <= 0:
		_on_task_complete()
	EventListener.emit_signal("task_update")
