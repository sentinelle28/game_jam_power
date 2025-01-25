extends BaseActor

class_name BaseEnemy
func _ready() -> void:
	health_component.connect("death",_on_death)

func get_target_point()->Vector2:
	return StockerRef.get_player().global_position
	
func get_direction()->Vector2:
	return (get_target_point()-global_position).normalized()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move(delta)

func _move(delta:float)->void:
	pass

func _on_death()->void:
	call_deferred("queue_free")
