extends Area2D

class_name BaseActor
@onready var health_component:HealthComponent = $HealthComponent
@export_category("actor")
@export var is_invicible:bool = false
@export var speed:int = 200
@export var max_acceleration:float = 1.0

var current_acceleration:float = 1.0
func _take_damage(damage:int )->void:
	if not is_invicible:
		health_component._take_damage(damage)
