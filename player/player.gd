extends CharacterBody2D

@export var health : float = 100.0
@export var speed = 300.0
@export var damage_rate = 20.0

signal player_health_depleted

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
		$AnimationPlayer.play("player_hurt")
		%ProgressBar.value = health
	
	if health <= 0.0:
		player_health_depleted.emit()
