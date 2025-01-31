extends TaskStrategyPattern
class_name QuickKillTask

var last_kill:float
var time_to_kill:float = 1.5

var requiered_kill:int = 2
var current_kill_count:int = 0

func _personal_init()->void:
	EventListener.connect("player_kill_enemy",_personnal_update_task)
	requiered_kill += int(Taskmanager.number_of_task_completed/5)
	time_to_kill += int(EnvironnementVar.difficulty)/10
	name = "Kill "+ str(requiered_kill) +" enemies in " + str(time_to_kill)
	name += " s"
	
	
func _personnal_update_task()->void:
	if current_kill_count == 0:
		last_kill = GlobalTimer.get_time()
	current_kill_count += 1
	if current_kill_count >= requiered_kill:
		TaskOverlay._update_specific_task_display(name,name)
		if GlobalTimer.get_time() - last_kill <= time_to_kill:
			_on_task_complete()
		else:
			current_kill_count = 0

func get_strategy_name()->String:
	return "quicl kill"
