extends Node

var array_of_enemy:Array[PackedScene] = [
	preload("res://c_actor/enemy/first_enemy.tscn"),
	preload("res://c_actor/enemy/one_way_block.tscn"),
	preload("res://c_actor/enemy/tank.tscn")]
	
func get_random_enemy()->BaseEnemy:
	return array_of_enemy[0].instantiate()
