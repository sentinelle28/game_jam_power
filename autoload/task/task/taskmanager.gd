extends Node

signal gen_new_task
var number_of_task_completed:int = 0
var number_of_task_needed_for_artifact:int = 3
var number_of_task_to_gen:int = 3

var current_task:Array[TaskStrategyPattern] = []

var possible_task:Array[TaskStrategyPattern] = [
	KillTask.new(),
	Dash.new(),
	WalkTask.new()] 

func _gen_new_task()->void:
	current_task.clear()
	var temp:Array[TaskStrategyPattern] = []
	for i:int in range(number_of_task_to_gen):
		var current:TaskStrategyPattern = possible_task.pick_random()
		while current in temp:
			current = possible_task.pick_random()
		temp.append(current)
		current_task.append(current.duplicate())
	temp.clear()
	
	_init_task()
	_verif_artifact()
	emit_signal("gen_new_task")
	
func _verif_artifact()->void:
	number_of_task_completed += 1
	if number_of_task_completed%number_of_task_needed_for_artifact == 0:
		LevelUpMenu._custom_show()
		
	
func _init_task()->void:
	for task:TaskStrategyPattern in current_task:
		task._init_task()
