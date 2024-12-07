extends CharacterBody2D

#@onready var player = get_tree().get_first_node_in_group("player")
@onready var player = get_node("/root/Game/Player")
var speed = 100
var enemy_health = 20

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	
	move_and_slide()
	

func take_damage():
	enemy_health -= 1
	$AnimationPlayer.play("hurt")
	if enemy_health <= 0:
		queue_free()
