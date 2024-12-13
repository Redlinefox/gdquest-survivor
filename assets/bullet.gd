extends Area2D

@export var damage = 1
@export var bullet_speed = 2000
@export var traveled_distance = 0
@export var bullet_range = 1600

func _ready() -> void:
	$BulletSound.set_pitch_scale(randf_range(1.5, 2.0))
	$BulletSound.play()


func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position +=  direction * bullet_speed * delta
	traveled_distance += bullet_speed * delta
	
	if traveled_distance > bullet_range:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)
