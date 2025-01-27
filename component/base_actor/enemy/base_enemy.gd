extends BaseActor

class_name BaseEnemy
@export_category("enemy_related")
@export var xp_to_drop:int = 1
func _ready() -> void:
	health_component.connect("death",_death_procedure)
	health_component.connect("took_damage",_on_damage_taken)

func _on_damage_taken()->void:
	AudioController._play("hit")
	ParticleSpawner._spawn_particle(global_position)
	
func get_target_point()->Vector2:
	return StockerRef.get_player().global_position
	
func get_direction()->Vector2:
	return (get_target_point()-global_position).normalized()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move(delta)

func _move(delta:float)->void:
	pass

func _death_procedure()->void:
	_on_death()
	EventListener.emit_signal("player_kill_enemy")



func _on_death()->void:
	call_deferred("queue_free")
