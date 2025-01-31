extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Taskmanager.connect("gen_new_task",_update_task_display)

func _update_task_display()->void:
	for i:int in range(3):
		var label:Label = $task_stocker.get_child(i)
		var current_task:TaskStrategyPattern = Taskmanager.current_task[i]
		label.text = current_task.name
		label.text += " ("
		label.text += current_task.name_of_the_reward
		label.text += ")"
	
func _update_specific_task_display(name_of_the_task:String,new_display):
	for i:int in range(3):
		if Taskmanager.current_task[i].name == name_of_the_task:
			var label:Label = $task_stocker.get_child(i)
			label.text = new_display
			_change_color(i,Color.YELLOW)
			break

func _reset_specific(name_of_the_task:String):
	for i:int in range(3):
		if Taskmanager.current_task[i].name == name_of_the_task:
			_change_color(i,Color.WHITE)
			break


func _change_color(index:int,color:Color)->void:
	$task_stocker.get_child(index).self_modulate = color
	
func _reset_color(index:int):
	$task_stocker.get_child(index).self_modulate = Color.WHITE
