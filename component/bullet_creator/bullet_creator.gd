extends Node2D

class_name BulletCreator
@export var bullet_ref:PackedScene
@export var radius:int = 10

func _shoot(direction:Vector2)->void:
	var new_child = bullet_ref.instantiate()
	new_child.global_position = global_position + radius*direction
	#bullet logic goes here
	StockerRef.get_bullet_stocker().add_child(new_child)
	
