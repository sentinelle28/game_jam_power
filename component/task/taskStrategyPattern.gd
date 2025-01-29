extends Resource

class_name TaskStrategyPattern

@export var reward:UpgradeStrategyPattern
@export var name_of_the_reward:String
@export var name:String

var is_already_triggered:bool = false

func _init_task(n_reward:UpgradeStrategyPattern,name_reward:String)->void:
	_general_init(n_reward,name_reward)
	_personal_init()
	
func _general_init(n_reward:UpgradeStrategyPattern,name_reward:String)->void:
	name_of_the_reward = name_reward
	reward = n_reward
	
func _personal_init()->void:
	pass
	
func _personnal_update_task()->void:
	pass
	
func _update_task()->void:
	_personnal_update_task()
	
func _on_task_complete()->void:
	if not is_already_triggered:
		is_already_triggered = true
		reward._apply_change(StockerRef.player)
		Taskmanager._gen_a_new_task(name)
		AudioController._play("upgrade")
		
	

func _update_task_meter(new_message:String)->void:
	TaskOverlay._update_specific_task_display(name,new_message)

func get_strategy_name()->String:
	return name
