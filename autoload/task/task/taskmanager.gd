extends Node

signal gen_new_task
var number_of_task_completed:int = 0
var number_of_task_to_gen = 3

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
	emit_signal("gen_new_task")
	
func _init_task()->void:
	for task:TaskStrategyPattern in current_task:
		task._init_task()
