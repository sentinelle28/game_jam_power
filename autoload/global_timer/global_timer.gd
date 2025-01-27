extends Node

var time:float = 0
var can_process_time:bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_process_time:
		time += delta

func _start()->void:
	can_process_time = true
	
func _reset()->void:
	time = 0
	
func get_time()->float:
	return time
