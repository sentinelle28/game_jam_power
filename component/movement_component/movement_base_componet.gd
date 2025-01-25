extends Node

class_name BaseMovementComponent
@onready var parent:Area2D = get_parent()
@export var speed:int = 100
@export var acceleration:float = 1.0
