extends Area2D

var damage = 1
var bullet_speed = 800
var traveled_distance = 0
var bullet_range = 1600

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position +=  direction * bullet_speed * delta
	traveled_distance += bullet_speed * delta
	
	if traveled_distance > bullet_range:
		queue_free()


#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#print("Left screen")
	#queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
