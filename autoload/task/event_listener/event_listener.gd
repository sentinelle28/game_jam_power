extends Node

signal player_kill_enemy
signal player_shoot
signal player_dash
signal player_walk(distance:float)
signal player_miss
signal time_passes(time:float)
signal player_take_damage

var num_enemy:int = 0
func _reset()->void:
	num_enemy = 0


func _ready() -> void:
	connect("player_kill_enemy",_compt_enemy)
	
func _compt_enemy()->void:
	num_enemy+=1
