extends Label

class_name HealthComponent
signal death
@export var max_health:int = 10
@export var health:int = 1
@export var regen:float = 0.0
@export var damage_reduction:float = 1.0

var timer:Timer

func _ready() -> void:
	timer = Timer.new()
	timer.one_shot = true
	health = max_health
	_show_health()
	timer.connect("timeout",_regen)

func _start_regen()->void:
	_init_timer()
	if regen > 0:
		timer.start(1/regen)
		
func _init_timer()->void:
	if not timer.is_inside_tree():
		get_tree().add_child(timer)
		
func _regen()->void:
	health += 1
	if health > max_health:
		health = max_health
	_start_regen()

func _take_damage(damage:int)->void:
	health -= damage * damage_reduction
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
