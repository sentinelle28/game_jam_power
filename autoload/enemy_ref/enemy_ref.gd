extends Node

var array_of_enemy:Array[PackedScene] = [
	preload("res://c_actor/enemy/first_enemy.tscn")]
	
func get_random_enemy(time:float)->BaseEnemy:
	return array_of_enemy[0].instantiate()
