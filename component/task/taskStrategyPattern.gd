extends Resource

class_name TaskStrategyPattern

@export var reward:UpgradeStrategyPattern
@export var name_of_the_reward:String
@export var name:String

func _init_task()->void:
	_general_init()
	_personal_init()
	
func _general_init()->void:
	name_of_the_reward = UpgradeRef.get_random_positive_upgrade()
	reward = UpgradeRef.get_positive_upgrade(name_of_the_reward)
	
func _personal_init()->void:
	pass
	
func _update_task()->void:
	pass
	
func _on_task_complete()->void:
	reward._apply_change(StockerRef.player)
	Taskmanager._gen_new_task()
