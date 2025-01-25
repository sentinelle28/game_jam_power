extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StockerRef._set_bullet_stocker($bullet_stocker)
	StockerRef._set_player($player)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Bullet:
		area.call_deferred("queue_free")

func _process(_delta: float) -> void:
	$Label.set_text("FPS %d" % Engine.get_frames_per_second())
