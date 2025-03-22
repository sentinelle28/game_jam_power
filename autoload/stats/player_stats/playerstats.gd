extends Node

var speed:int = 170
var max_acceleration:float = 1.0
var max_health:int = 10
var dash_mult:float = 1.1
var dash_invicibility_frame:float = 0.2
var dash_recovery:float = 0.9
var crit_change:int = 0
var crit_damage:float = 2.0
var shooting_cooldown:float = 0.7
var bullet_size:int = 1
var bullet_speed:int = 230
var bullet_pierce:int = 0
var bullet_to_shoot:int = 1

var player_properties:Dictionary = {"speed":speed,
"max_acceleration":max_acceleration,
"bullet_smax_healthize":max_health,
"dash_invicibility_frame":dash_mult,
"dash_recovery":dash_recovery,
"crit_change":crit_change, 
"crit_damage":crit_damage,
"shooting_cooldown":shooting_cooldown,
"bullet_size":bullet_size,
"bullet_speed":bullet_speed,
"bullet_pierce":bullet_pierce,
"bullet_to_shoot":bullet_to_shoot}
