extends Node2D

@onready var main = get_tree().get_root().get_node("main")
@onready var projectile = load("res://projectile.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnpos = global_position
	instance.spawnRot = rotation 
	main.add_child.call_deferred(instance)
