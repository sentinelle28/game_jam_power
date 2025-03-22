extends Node


var time_between_enemy:float = 1.5
var difficulty:float = 1
var power_spawn_time:float = 3.0
var enemy_max_health_sup:int = 0

var start_heigh:float = 1.5

const difficulty_scaling:float = 0.25
const spawn_time_scale:float = 0.35 #x/2
const heigh_time_scale:float = 1.15

func _reset()->void:
	time_between_enemy = 1.5
	difficulty = 1
	power_spawn_time = 3.0
	enemy_max_health_sup = 0
	start_heigh = 1.5
	
	
func _update_difficulty(time:float)->void:
	if GlobalTimer.minute <= 4:
		time_between_enemy = get_spawn_value(time)
	else:
		time_between_enemy = 0.7
	

func _augment_difficulty(to_add:float)->void:
	difficulty += to_add
	enemy_max_health_sup += 1
	start_heigh *= 0.9
	Taskmanager._update_task_requiered()
	
	
func get_spawn_value(value:float)->float:
	var modulo:int = int(value)%60
	var size:float = 0.025
	var calc_value:float = size * float(modulo) + start_heigh
	return calc_value
