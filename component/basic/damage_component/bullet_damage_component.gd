extends DamageComponent

class_name BulletDamageComponent
@onready var pierce:int = get_parent().pierce
func _deal_damage_to(area:Area2D)->void:
	if area is BaseActor:
		area._take_damage(damage)
		if pierce <= 0:
			get_parent().call_deferred("queue_free")
		pierce -= 1
		
