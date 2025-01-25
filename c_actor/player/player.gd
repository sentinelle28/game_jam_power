extends BaseActor

class_name Player
@onready var bullet_creator:BulletCreator = $BulletCreator
@onready var bullet_timer:Timer = $BulletTimer
@onready var dashtimer:Timer = $DashTimer
@onready var screen_size:Vector2 = get_viewport_rect().size
@export var gradient_texture:GradientTexture1D

@export var shooting_cooldown:float = 0.5
@export var dash_mult:float = 2.0
@export var dash_invicibility_frame:float = 0.5
@export var dash_recovery:float = 1.0

@export var bullet_size:float = 1

#to add
@export var crit_change:int = 0
@export var crit_damage:float = 2.0

@export var bullet_pierce:int = 0
@export var bullet_speed:int = 230



func _ready() -> void:
	DeathPanel.connect("reset",_reset)
	health_component.connect("death",_death)
	LevelUpMenu.connect("update_stats",_update_stats)
	
func _reset()->void:
	for property:StringName in Playerstats.player_properties:
		set(property,Playerstats.player_properties[property])

func _update_stats(upgrade:UpgradeStrategyPattern)->void:
	if upgrade is HealthUpgrade:
		upgrade._apply_change(health_component)
	else:
		upgrade._apply_change(self)

func _death()->void:
	DeathPanel.emit_signal("player_is_dead")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_move(delta)
	_shoot()
	_update_color()

func _update_color()->void:
	var ratio:float = float(PlayerXp.xp)/float(PlayerXp.max_xp)
	modulate = gradient_texture.gradient.sample(ratio)

func _move(delta:float)->void:
	var direction:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if direction == Vector2.ZERO:
		current_acceleration = 0
	else:
		current_acceleration = lerp(current_acceleration,max_acceleration,0.1)
		var dashmult:float = _dash()
		global_position += direction* speed * current_acceleration * delta * dashmult
		global_position.x = wrapf(global_position.x,0,screen_size.x)
		global_position.y = wrapf(global_position.y,0,screen_size.y)
	
func _dash()->float:
	if Input.is_action_just_pressed("dash") and $DashTimer.time_left == 0:
		dashtimer.start(dash_invicibility_frame)
		is_invicible = true
		return dash_mult
	elif is_invicible:
		return dash_mult
	return 1

func _on_dash_timer_timeout() -> void:
	if is_invicible:
		is_invicible = false
		dashtimer.start(dash_recovery)

func _shoot()->void:
	if Input.is_action_just_pressed("shoot") and bullet_timer.time_left==0:
		var direction:Vector2 = (global_position.direction_to(get_global_mouse_position()))
		bullet_creator._shoot(direction)
		bullet_timer.start(shooting_cooldown)
