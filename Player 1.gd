extends CharacterBody2D

var movespeed = 500
var bullet_speed = 2000
var bullet = preload("res://bullet.tscn")
var input_direction = Vector2()

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
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_mouse_position()
	bullet_instance.roation_degrees = rotation_degrees
	bullet_instance.apply_impulsive(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
	
	
	
