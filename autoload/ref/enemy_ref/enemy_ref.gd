extends Node

var array_of_enemy:Array[PackedScene] = [
	preload("res://c_actor/enemy/first_enemy.tscn"),
	preload("res://c_actor/enemy/one_way_block.tscn"),
	preload("res://c_actor/enemy/tank.tscn"),
	preload("res://c_actor/enemy/shooter.tscn")]
	
func get_random_enemy()->BaseEnemy:
	var possible:Array[int] = []
	for i:int in range(len(array_of_enemy)):
		if i+1 <= EnvironnementVar.difficulty:
			possible.append(i)
		else:
			break
	return array_of_enemy[possible.pick_random()].instantiate()
