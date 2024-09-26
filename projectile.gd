extends Area2D

@export var speed = 10.0


var dir : float
var spawnpos : Vector2
var spwanRot : float

func _physics_process(delta):
	position += Vector2(0, -speed).rotated(dir)
	
	func _on_projectile_body_entered(enemy1w)#work on it later

