extends CharacterBody2D

var can_shoot = true
var movespeed = 500
var bullet_speed = 2000
var health = 100
var max_health = 100
@onready var health_bar: ProgressBar = $HealthBar  # Adjust path if needed

var input_direction = Vector2()
@export var Bullet : PackedScene
var enemy_health = 5


func _physics_process(_delta):
	input_direction = Vector2()  # Reset input direction each frame
	
	if Input.is_action_pressed("Up"):
		input_direction.y -= 1
	if Input.is_action_pressed("Down"):
		input_direction.y += 1
	if Input.is_action_pressed("Right"):
		input_direction.x += 1
	if Input.is_action_pressed("Left"):
		input_direction.x -= 1
	if Input.is_action_pressed("Shoot"):
		$GPUParticles2D.emitting = true
	else:
		$GPUParticles2D.emitting = false
		

	input_direction = input_direction.normalized()  # Normalize input direction
	velocity = input_direction * movespeed  # Set velocity based on input direction and movespeed
	move_and_slide()  # Move and slide with the calculated velocity
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("Shoot"):
		fire()
		$Timer.start(1)
		can_shoot = false
	
	
func fire():
	var bullet_instance = Bullet.instantiate()
	print(get_global_position())
	bullet_instance.global_position = get_global_position()
	bullet_instance.dir = get_rotation()+1.5708
	#bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	print(bullet_instance.get_global_position())
	
func _ready():
	add_to_group("players")  # Add to 'players' group
	#health_bar.max_value = max_health
	#health_bar.value = health

func take_damage(amount: int):
	health -= amount
	health_bar.value = health  # Update health bar
	print("Player Health: ", health)
	if health <= 0:
		die()  # Call die method when health is zero or less

func die():
	queue_free()  # Remove the player or trigger game over
	print("Player has died.")

func _on_timer_timeout():
	$Timer.stop()
	can_shoot = true


func _on_projectile_body_entered(body):
	pass
