extends Area2D

@export var speed = 10.0


var dir : float
var spawnpos : Vector2
var spwanRot : float

func _physics_process(delta):
	position += Vector2(0, -speed).rotated(dir)
	
