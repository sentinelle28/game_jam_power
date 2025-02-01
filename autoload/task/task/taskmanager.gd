extends Node

signal gen_new_task
var number_of_task_completed:int = 0
var number_of_task_needed_for_artifact:int = 5
var number_of_task_to_gen:int = 3

var current_task:Array[TaskStrategyPattern] = []

var possible_task:Array[TaskStrategyPattern] = [
	KillTask.new(),
	Dash.new(),
	WalkTask.new(),
	QuickKillTask.new()] 

func _gen_new_task()->void:
	current_task.clear()
	var temp:Array[int] = []
	for i:int in range(len(possible_task)):
		temp.append(i)
	for i:int in range(3):
		var alea:int = temp.pick_random()
		current_task.append(possible_task[alea].duplicate())
		temp.erase(alea)
	temp.clear()
	_init_task()
	emit_signal("gen_new_task")
	
func _verif_artifact()->void:
	number_of_task_completed += 1
	if number_of_task_completed%number_of_task_needed_for_artifact == 0:
		LevelUpMenu._custom_show()
		
func _gen_a_new_task(name_of_the_task:String)->void:
	var index:int = 0
	var to_not_pick:Array[String] = []
	var reward_to_not_pick:Array[String] = []
	for i:int in range(3):
		if current_task[i].name == name_of_the_task:
			index = i
		to_not_pick.append(current_task[i].get_strategy_name())
		reward_to_not_pick.append(current_task[i].name_of_the_reward)
	
	#select a new task
	var task:Array[int] = []
	for i:int in range(len(possible_task)):
		if not possible_task[i].get_strategy_name() in to_not_pick:
			task.append(i)
		
	
	var picked:TaskStrategyPattern = possible_task[task.pick_random()].duplicate()
	task.clear()
	#select a new reward
	
	var reward:Array[String] = []
	for i:int in range(len(UpgradeRef.positive_upgrade)):
		if not UpgradeRef.positive_upgrade.keys()[i] in reward_to_not_pick:
			reward.append(UpgradeRef.positive_upgrade.keys()[i])
	var selected_name:String = reward.pick_random()
	var seletec_reward:UpgradeStrategyPattern = UpgradeRef.get_positive_upgrade(selected_name)
	reward.clear()
	current_task[index] = picked
	current_task[index]._init_task(seletec_reward,selected_name)
	TaskOverlay._reset_specific(current_task[index].name)
	_verif_artifact()
	
	
	
func _init_task()->void:
	var upgrades:Array[String] = UpgradeRef.get_random_upgrades()
	for i:int in range(number_of_task_to_gen):
		current_task[i]._init_task(UpgradeRef.get_positive_upgrade(upgrades[i]),upgrades[i])


func _update_task_requiered()->void:
	number_of_task_needed_for_artifact =get_new_task_for_artifact(EnvironnementVar.difficulty)
	
func get_new_task_for_artifact(value:float)->int:
	var calc_value:float = 0.25*(value**2) + 3
	return int(calc_value)
	
