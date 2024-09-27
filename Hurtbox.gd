extends Area2D

var max_health: float = 100
var current_health: float
var min_health: float = 0

func _ready():
	current_health = max_health
	
func _physics_process(delta):
	if health <= health_min:
		queue_free()
		
