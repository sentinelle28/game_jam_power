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
	var new_text:String = "Walk " + str(int(distance_to_walk))
	new_text += " "
	new_text += "(" + name_of_the_reward + ")"
	_update_task_meter(new_text)
	
