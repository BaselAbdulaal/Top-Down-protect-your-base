extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
