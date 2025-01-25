extends Node


var bullet_stocker:Node

func _set_bullet_stocker(new_node:Node)->void:
	bullet_stocker = new_node
	
func get_bullet_stocker()->Node:
	return bullet_stocker
