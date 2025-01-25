extends Label

class_name HealthComponent
signal death
@export var max_health:int = 10
@export var health:int = 1

func _ready() -> void:
	health = max_health
	_show_health()

func _take_damage(damage:int)->void:
	health -= damage
	if health <= 0:
		emit_signal('death')
	_show_health()

func _show_health()->void:
	text = str(health)

func _update_max_health(new_max_health:int)->void:
	if health > new_max_health:
		health = new_max_health
		max_health = new_max_health
	_show_health()
