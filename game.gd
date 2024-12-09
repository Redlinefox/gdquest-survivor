extends Node2D


func _ready() -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("exit_game"):
		get_tree().quit()
		
	if event.is_action_pressed("toggle_fullscreen"):
		if DisplayServer.window_get_mode() == 0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		elif DisplayServer.window_get_mode() == 3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func spawn_mob():
	var new_mob = preload("res://enemy/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_enemy_spawn_timer_timeout() -> void:
	spawn_mob()


func _on_player_player_health_depleted() -> void:
	%GameOverScreen.visible = true
	get_tree().paused = true


func _on_restart_game_button_pressed() -> void:
	get_tree().reload_current_scene()
