extends CanvasLayer

@onready var main = $"../"

func _on_resume_button_pressed() -> void:
	main.activate_pause_menu()


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menus/start_menu.tscn")


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
