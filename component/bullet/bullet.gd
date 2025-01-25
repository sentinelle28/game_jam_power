extends Area2D

class_name Bullet
@export var speed:int 
@export var direction:Vector2
@export var lifetime:float
@export var max_acceleration:float
var current_acceleration:float = 1.0


func _move()->void:
	pass
	
