extends Node

class_name DamageComponent
@export var damage:int = 1
@export var crit_chance:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().connect("area_entered",_deal_damage_to)


func _deal_damage_to(area:Area2D)->void:
	pass
