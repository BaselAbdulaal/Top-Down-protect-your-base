extends Node2D

var enemy_scene =preload("res://path.finding.tscn")
func _ready():
	$Timer.start()
	

func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	print("1")

