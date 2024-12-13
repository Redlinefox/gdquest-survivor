extends Node2D

@export var pause_menu : Node
@export var game_over_screen : Node

var paused = false

func _ready() -> void:
	Global.score = 0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		activate_pause_menu()
		
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
	game_over_screen.visible = true
	get_tree().paused = true


func activate_pause_menu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		pause_menu.show()
	paused = !paused
