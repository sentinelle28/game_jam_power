extends Node


var time_between_enemy:float = 1.5
var difficulty:float = 1
var power_spawn_time:float = 3.0

const difficulty_scaling:float = 0.25
const spawn_time_scale:float = 0.35 #x/2
const heigh_time_scale:float = 1.15

func _reset()->void:
	time_between_enemy = 1.5
	difficulty = 1
	power_spawn_time = 3.0
	
func _change_difficulty()->void:
	_augment_difficulty(difficulty_scaling)
	Taskmanager._update_task_requiered()
	

func _augment_difficulty(to_add:float)->void:
	difficulty += to_add
	time_between_enemy = get_spawn_value(difficulty)
	
func get_spawn_value(value:float)->float:
	var calc_value:float = spawn_time_scale*(cos(value*PI)) + heigh_time_scale
	return calc_value
