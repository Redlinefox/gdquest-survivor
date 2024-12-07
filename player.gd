extends CharacterBody2D

var health : float = 100.0
var speed = 300.0
var damage_rate = 5.0

signal player_died

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
	
	var getting_swarmed = %Hurtbox.get_overlapping_bodies()
	if getting_swarmed.size() > 0:
		health -= getting_swarmed.size() * damage_rate * delta
		%ProgressBar.value = health
	
	if health <= 0.0:
		player_died.emit()