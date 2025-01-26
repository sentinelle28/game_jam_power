extends TaskStrategyPattern

class_name KillTask
@export var number_to_kill:int = 3

func _personal_init()->void:
	name = "Kill 3 enemies"
	EventListener.connect("player_kill_enemy",_update_task)
	
func _personnal_update_task()->void:
	number_to_kill -= 1
	if number_to_kill <= 0:
		_on_task_complete()
	var new_text:String = "Kill " + str(number_to_kill)
	new_text += " enemies "
	new_text += "(" + name_of_the_reward + ")"
	_update_task_meter(new_text)
