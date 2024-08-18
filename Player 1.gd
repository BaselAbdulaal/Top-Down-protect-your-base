extends CharacterBody2D

var movespeed = 200
var bullet_speed = 2000
var bullet = preload("res://projectile.gd")
var input_direction = Vector2()
@export var Bullet : PackedScene

func _ready():
	pass

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

	input_direction = input_direction.normalized()  # Normalize input direction
	velocity = input_direction * movespeed  # Set velocity based on input direction and movespeed
	move_and_slide()  # Move and slide with the calculated velocity
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("Shoot"):
		fire()
	
	
func fire():
	var bullet_instance = Bullet.instantiate()
	print(get_global_position())
	bullet_instance.global_position = get_global_position()
	bullet_instance.dir = get_rotation()+1.5708
	#bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	print(bullet_instance.get_global_position())

