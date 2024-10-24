extends CharacterBody2D
@onready var anim = $AnimatedSprite2D

var speed = 35
var player_chase = true
var player = null
var enemy_scene = preload("res://Scenes/Rats.tscn")
var hp = 3
var player_in_attack_zone = false
var can_take_damage = true
	
func _physics_process(delta):
	
	
	if player_chase and player != null:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		
		# Verifica se o movimento é mais horizontal ou vertical
		if abs(direction.x) > abs(direction.y):
			# Se o movimento for horizontal
			$AnimatedSprite2D.play("Walk Front")
			
			# Inverte a escala se o personagem estiver indo para a esquerda
			if direction.x < 0:
				$AnimatedSprite2D.scale.x = 1 # Inverte para a esquerda
			else:
				$AnimatedSprite2D.scale.x = -1   # Normal para a direita
		else:
			# Movimento vertical
			if direction.y > 0:
				$AnimatedSprite2D.play("Walk Down")
			else:
				$AnimatedSprite2D.play("Walk Up")
				

	move_and_slide()
	take_damage()
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	player = null
	player_chase = false

func rats():
	pass


func _on_rats_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_attack_zone = true


func _on_rats_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_attack_zone = false

func take_damage():
	if player_in_attack_zone and Global.player_current_attack == true:
		if can_take_damage == true:
			hp = hp - 1
			$damage_cooldown.start()
			can_take_damage = false
			print("Vida do rato: ", hp)
			if hp <= 0:
				anim.play("Death")
				queue_free()


func _on_damage_cooldown_timeout() -> void:
	can_take_damage = true
