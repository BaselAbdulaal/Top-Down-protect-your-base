extends CharacterBody2D

@export var speed = 100.0


var dir : float
var spawnpos : Vector2
var spwanRot : float

func _ready(): 
	global_position = spawnpos
	global_rotation = spwanRot
	
func _physics_process(delta):
	velocity = Vector2(0, -speed).rotated(dir)
	move_and_slide()
	
