extends Area2D

@onready var laser_sight := %LaserSight

var enemies_in_range : Array[Node2D] = []
var bfr = 2.0

func _physics_process(delta: float) -> void:
	enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = get_closest_enemy(enemies_in_range)
		if target_enemy != null:
			$WeaponPivot.look_at(target_enemy.global_position)
			laser_sight.points[0] = %ShootingPoint.global_position
			laser_sight.points[1] = target_enemy.global_position
	else:
		search_enemies(delta)


func shoot():
	var load_bullet_scene = preload("res://assets/bullet.tscn")
	var new_bullet = load_bullet_scene.instantiate()
	%ShootingPoint.add_child(new_bullet)
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation


func _on_timer_timeout() -> void:
	if enemies_in_range.size() > 0:
		laser_sight.visible = true
		shoot()
	else:
		laser_sight.visible = false
		pass
	#%BulletFireRate.wait_time = 1/bfr


func get_closest_enemy(array_of_enemies):
	# Reset range of closest_enemy
	var closest_enemy_distance = 1000.0
	var closest_enemy
	var enemy_distance = Vector2.ZERO
	
	for enemy in array_of_enemies:
		enemy_distance = global_position.distance_to(enemy.global_position)
		if enemy_distance < closest_enemy_distance:
			closest_enemy_distance = enemy_distance
			closest_enemy = enemy
	return closest_enemy


func search_enemies(delta):
	$WeaponPivot.rotation_degrees += 100 * delta
	laser_sight.points[0] = %ShootingPoint.global_position
	laser_sight.points[1] = %LaserOffset.global_position
