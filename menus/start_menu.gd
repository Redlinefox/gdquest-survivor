extends Control

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level1.tscn")


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/options_menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
