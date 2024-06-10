extends CharacterBody2D


var movespeed = 500

func _ready():
	pass
func _physics_process(delta):
	
	if Input.is_action_just_pressed("Up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("Down"):
		velocity.y += 1
	if Input.is_action_just_pressed("Right"):
		velocity.x += 1
	if Input.is_action_just_pressed("Left"):
		velocity.x -= 1
		
	velocity = velocity.normalized() * movespeed
	move_and_slide()
	
	
