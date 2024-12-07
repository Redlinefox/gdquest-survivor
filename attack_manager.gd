extends Area2D

var enemies_in_range = get_overlapping_bodies()

func _physics_process(_delta: float) -> void:
	enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		$WeaponPivot.look_at(target_enemy.global_position)
		#look_at(target_enemy.global_position)


func shoot():
	var load_bullet_scene = preload("res://bullet.tscn")
	var new_bullet = load_bullet_scene.instantiate()
	%ShootingPoint.add_child(new_bullet)
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation


func _on_timer_timeout() -> void:
		if enemies_in_range.size() > 0:
			shoot()
		else:
			pass
