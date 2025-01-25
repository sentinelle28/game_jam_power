extends Area2D

class_name Bullet
@export var pierce:int = 0
@export var speed:int = 200
@export var direction:Vector2
@export var max_acceleration:float = 1.0
var current_acceleration:float = 1.0

func _process(delta: float) -> void:
	_move(delta)

func _move(delta: float)->void:
	pass
	
func _set_direction(new_direction:Vector2)->void:
	direction = new_direction
