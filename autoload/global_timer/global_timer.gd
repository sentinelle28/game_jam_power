extends Node

var time:float = 0
var can_process:bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_process:
		time += delta

func _start()->void:
	can_process = true
	
func _reset()->void:
	time = 0
	
func get_time()->float:
	return time
