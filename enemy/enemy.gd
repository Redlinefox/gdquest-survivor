extends CharacterBody2D

#@onready var player = get_tree().get_first_node_in_group("player")
@onready var player = get_node("/root/Level1/Player")
var speed = 100
var enemy_health = 5

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	
	move_and_slide()
	

func take_damage(incoming_damage):
	enemy_health -= incoming_damage
	$AnimationPlayer.play("hurt")
	if enemy_health <= 0:
		queue_free()
