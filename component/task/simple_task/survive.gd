extends TaskStrategyPattern

class_name SurviveTask
var to_survive:float = 60.0
var current:float = 0.0

func _personal_init()->void:
	EventListener.connect("time_passes",_custom_personnal_task)
	EventListener.connect("player_take_damage",_reset_shot)
	to_survive += Taskmanager.number_of_task_completed*2
	name = "Survive for "
	name += str(to_survive)
	name += " s"
	name += "(" + name_of_the_reward + ")"
	
func _custom_personnal_task(value:float)->void:
	current += value
	if current >=to_survive:
		_on_task_complete()
	var new_text:String = "Survive for " + str(int(to_survive-current))
	new_text += " s"
	new_text += "(" + name_of_the_reward + ")"
	_update_task_meter(new_text)
	
func _reset_shot()->void:
	current = 0
	
	
func get_strategy_name()->String:
	return "survive"
