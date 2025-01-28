extends TaskStrategyPattern

class_name KillTask
@export var number_to_kill:int = 3

func _personal_init()->void:
	EventListener.connect("player_kill_enemy",_update_task)
	number_to_kill += Taskmanager.number_of_task_completed
	name = "Kill " + str(number_to_kill) + " enemies"
	
func _personnal_update_task()->void:
	number_to_kill -= 1
	if number_to_kill <= 0:
		_on_task_complete()
	var new_text:String = "Kill " + str(number_to_kill)
	new_text += " enemies "
	new_text += "(" + name_of_the_reward + ")"
	_update_task_meter(new_text)

func get_strategy_name()->String:
	return "kill"
