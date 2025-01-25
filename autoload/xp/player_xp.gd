extends Node


var xp:int = 0
var max_xp:int = 100
var level:int = 1
var mult_xp:float= 1.0

func _add_xp(value:int)->void:
	xp+= value*mult_xp
	if xp>= max_xp:
		xp-= max_xp
		level += 1
		max_xp = level*100
