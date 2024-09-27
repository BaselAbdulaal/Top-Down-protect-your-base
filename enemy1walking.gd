extends CharacterBody2D

var health: int = 100
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


 #Called when the node enters the scene tree for the first time
func _ready() -> void:
	add_to_group("enemies")  # Add to the "enemies" group for collision detection

# Function to take damage
func take_damage(amount: int) -> void:
	health -= amount
	print("getting hit")
	if health <= 0:
		die()

# Handle enemy death
func die() -> void:
	queue_free()  # Remove the enemy from the scene
