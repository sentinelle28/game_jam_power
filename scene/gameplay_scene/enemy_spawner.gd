extends Node2D

@export var player:Player
@export var enemy_stocker:Node2D
var time_to_wait:float = 5.0
var max_to_spawn:int = 3
var radius:int = 1200

func _ready() -> void:
	DeathPanel.connect("reset",_reset)

func _reset()->void:
	for enemy:BaseEnemy in enemy_stocker.get_children():
		enemy_stocker.call_deferred("remove_child",enemy)
		
func _spawn_enemies()->void:
	for i in range(randi_range(1,max_to_spawn)):
		_spawn_enemy()
	
func _spawn_enemy()->void:
	var x:float = randf_range(-1,1)
	var y:float = randf_range(-1,1)
	var new_enemy:BaseEnemy = EnemyRef.get_random_enemy(0)
	enemy_stocker.add_child(new_enemy)
	new_enemy.global_position = global_position + Vector2(x,y)*radius


func _on_timer_timeout() -> void:
	_spawn_enemies()
	$Timer.start(EnvironnementVar.time_between_enemy)
