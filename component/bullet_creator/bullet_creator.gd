extends Node2D

class_name BulletCreator
@export var bullet_ref:PackedScene
@export var radius:int = 10
@onready var bullet_size:int = get_parent().bullet_size

func _shoot(direction:Vector2)->void:
	var new_child:Bullet = bullet_ref.instantiate()
	StockerRef.get_bullet_stocker().add_child(new_child)
	new_child.global_position = global_position + radius*direction
	new_child._set_direction(direction)
	new_child.scale *= bullet_size
