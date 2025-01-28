extends TaskStrategyPattern
class_name QuickKillTask

var last_kill:float
var time_to_kill:float = 1.0

var requiered_kill:int = 2
var current_kill_count:int = 0

func _personal_init()->void:
	name = "Kill "+ str(requiered_kill) +" enemies in " + str(time_to_kill)
	name += " s"
	EventListener.connect("player_kill_enemy",_personnal_update_task)
	requiered_kill *= EnvironnementVar.difficulty
	time_to_kill += roundf(EnvironnementVar.difficulty)/10
	
	
func _personnal_update_task()->void:
	if current_kill_count == 0:
		last_kill = GlobalTimer.get_time()
	current_kill_count += 1
	if current_kill_count >= requiered_kill:
		if GlobalTimer.get_time() - last_kill <= time_to_kill:
			_on_task_complete()
		else:
			current_kill_count = 0

func get_strategy_name()->String:
	return "quicl kill"
