extends Node


var bullet_stocker:Node
var player:Player

func _set_bullet_stocker(new_node:Node)->void:
	bullet_stocker = new_node
	
func get_bullet_stocker()->Node:
	return bullet_stocker

func _set_player(new_player:Player)->void:
	player = new_player
	
func get_player()->Player:
	return player
