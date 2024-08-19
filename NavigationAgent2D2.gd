extends NavigationAgent2D

var movement_speed = 50.0
@export var target: Node2D = null

@onready var navigation_agent_2d = $NavigationAgent2D


func _ready():
	call_deferred("enemy_setup")
	pass
	
func _enemy_setup():
