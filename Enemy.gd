extends CharacterBody2D


const SPEED = 300.0
var player_position
var target_position
var player = get_parent().get_node("player")

func _physics_process(delta):
	
	velocity = Vector2.ZERO
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		velocity = (target_position * SPEED)
		look_at(player_position)

