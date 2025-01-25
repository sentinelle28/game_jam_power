extends Node

var xp:int = 0
var max_xp:int = 1
var level:int = 1
var mult_xp:float= 1.0
var number_of_kill:int = 0

func _add_xp(value:int)->void:
	xp += value*mult_xp
	number_of_kill += 1
	if xp>= max_xp:
		LevelUpMenu._custom_show()
		xp-= max_xp
		level += 1
		max_xp = level*100

func _reset()->void:
	xp = 0
	max_xp = 40
	level = 1
	mult_xp = 1.0
	number_of_kill = 0
