extends Label

class_name HealthComponent
@export var max_health:int = 10
@onready var health:int = max_health

func _ready() -> void:
	text = str(health)

func _take_damage(damage:int)->void:
	health -= damage
	if health <= 0:
		pass

func _show_health()->void:
	text = str(health)
