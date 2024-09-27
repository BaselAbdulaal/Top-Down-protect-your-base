extends Area2D

@export var speed = 10.0


var dir : float
var spawnpos : Vector2
var spwanRot : float

func _physics_process(delta):
	position += Vector2(0, -speed).rotated(dir)
	

	
#func _on_projectile_body_entered(enemy1w)#work on it later



func _on_body_entered(body):
	if body.is_in_group("enemies"):  # Assuming enemies are in the "enemies" group
		body.take_damage(10)  # Deal 10 damage (or adjust as needed)
		queue_free()  # Remove the bullet
