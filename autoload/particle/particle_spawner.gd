extends Node


var particle:PackedScene = preload("res://component/hit_particle/hit_particle.tscn")

func _spawn_particle(coord:Vector2)->void:
	var new_particle:CPUParticles2D = particle.instantiate()
	StockerRef.particle_stocker.add_child(new_particle)
	new_particle.global_position = coord
