extends OnPlayerHitUpgrade

class_name ExplodeOnHit

var particle:PackedScene = preload("res://component/hit_particle/explosion_particle.tscn")
var range:int = 100

func _apply_custom(target:Player)->void:
	var player_pos:Vector2 = StockerRef.player.global_position
	for enemy:BaseEnemy in StockerRef.enemy_stocker.get_children():
		if enemy.global_position.distance_to(player_pos) < range:
			enemy.health_component._take_damage(1)
			
	var particle:CPUParticles2D = particle.instantiate()
	StockerRef.particle_stocker.add_child(particle)
	particle.global_position = player_pos
	AudioController._play("explosion")
