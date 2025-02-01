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
@export var bullet_to_shoot:int = 1



var on_player_hit_upgrade:Array[OnPlayerHitUpgrade] = []
var on_player_dash:Array[OnPlayerDash] = []

func _ready() -> void:
	DeathPanel.connect("reset",_reset)
	health_component.connect("death",_death)
	health_component.connect("took_damage",_on_hit)
	
func _on_hit()->void:
	AudioController._play("player hit")
	for elt:OnPlayerHitUpgrade in on_player_hit_upgrade:
		elt._apply_change(self)
	if health_component.health <= 2:
		AudioController._play("one hp")
	EventListener.emit_signal("player_take_damage")
	
func _on_dash()->void:
	for elt:OnPlayerDash in on_player_dash:
		elt._apply_change(self)
	
	
func _reset()->void:
	for property:StringName in Playerstats.player_properties:
		set(property,Playerstats.player_properties[property])
	on_player_hit_upgrade.clear()
	on_player_dash.clear()

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
	

func _move(delta:float)->void:
	var direction:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if direction == Vector2.ZERO:
		current_acceleration = 0
	else:
		current_acceleration = lerp(current_acceleration,max_acceleration,0.1)
		var dashmult:float = _dash()
		var movement:Vector2 = direction* speed * current_acceleration * delta * dashmult
		
		var distance_travel:float = movement.length()
		EventListener.emit_signal("player_walk",distance_travel)
		global_position += movement
		global_position.x = wrapf(global_position.x,0,screen_size.x)
		global_position.y = wrapf(global_position.y,0,screen_size.y)
	
func _dash()->float:
	if Input.is_action_just_pressed("dash") and $DashTimer.time_left == 0:
		dashtimer.start(dash_invicibility_frame)
		is_invicible = true
		EventListener.emit_signal("player_dash")
		AudioController._play("dash")
		_on_dash()
		return dash_mult
	elif is_invicible:
		return dash_mult
	return 1

func _on_dash_timer_timeout() -> void:
	if is_invicible:
		is_invicible = false
		dashtimer.start(dash_recovery)

func _shoot()->void:
	if Input.is_action_pressed("shoot") or Input.is_action_just_pressed("shoot"):
		if bullet_timer.time_left == 0:
			var direction:Vector2 = (global_position.direction_to(get_global_mouse_position()))
			_shoot_toward(direction)
			bullet_timer.start(shooting_cooldown)
			AudioController._play("shoot")


func _shoot_toward(direction:Vector2):
	var n_direction:Vector2 = direction
	if direction == Vector2.ZERO:
		n_direction = Vector2(1,1)
	for i:int in range(bullet_to_shoot):
		bullet_creator._shoot(n_direction)
		
