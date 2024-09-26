extends CharacterBody2D

var speed = 100
var player_chase = false
var player  = null
var enemy_health = 5

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed
	print(enemy_health)


func _on_detection_body_entered(body):
	player = body
	player_chase = true	


func _on_detection_body_exited(body):
	player = null
	player_chase = false


func _on_projectile_body_entered(body):
	enemy_health -= 1
