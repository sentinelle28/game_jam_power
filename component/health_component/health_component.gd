extends Label

class_name HealthComponent
signal death
@export var max_health:int = 10
@onready var health:int = max_health

func _ready() -> void:
	text = str(health)

func _take_damage(damage:int)->void:
	health -= damage
	if health <= 0:
		emit_signal('death')
	_show_health()

func _show_health()->void:
	text = str(health)
