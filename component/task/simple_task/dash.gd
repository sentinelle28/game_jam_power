extends TaskStrategyPattern

class_name Dash

var number_to_dash:int = 5

func _personal_init()->void:
	name = "dash " + str(number_to_dash) + " times"
	EventListener.connect("player_dash",_update_task)
	
func _personnal_update_task()->void:
	number_to_dash -= 1
	if number_to_dash <= 0:
		_on_task_complete()
	var new_text:String = "dash " + str(number_to_dash)
	new_text += " times "
	new_text += "(" + name_of_the_reward + ")"
	_update_task_meter(new_text)

func get_strategy_name()->String:
	return "dash"
