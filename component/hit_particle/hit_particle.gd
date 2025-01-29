extends CPUParticles2D



func _ready() -> void:
	emitting = true
	one_shot = true
	await get_tree().create_timer(0.2).timeout
	call_deferred("queue_free")
