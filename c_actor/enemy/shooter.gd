extends BaseEnemy

@export var bullet:PackedScene
@export var range:float = 300
@export var wait_time:float = 0.4
var cooldown:float = 0

func _move(delta:float)->void:
	if global_position.distance_to(StockerRef.player.global_position) <= range:
		if cooldown <= 0:
			_shoot()
			cooldown = wait_time
		cooldown -= delta
	else:
		current_acceleration = lerp(current_acceleration,max_acceleration,delta)
		global_position += get_direction()*speed*current_acceleration*delta


func _shoot()->void:
	var new_bullet:Bullet = bullet.instantiate()
	StockerRef.bullet_stocker.add_child(new_bullet)
	new_bullet.global_position = global_position
	new_bullet.direction = get_direction()
