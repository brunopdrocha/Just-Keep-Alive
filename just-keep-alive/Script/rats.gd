extends CharacterBody2D


var speed = 35
var player_chase = true
var player = null
var enemy_scene = preload("res://Scenes/Rats.tscn")
var dead = false
	
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
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	player = null
	player_chase = false


	


func _on_detection_area_area_entered(area):
	if area.is_in_group("Sword"):
		dead == true;
		$AnimatedSprite2D.play("Death");


func _on_animated_sprite_2d_animation_finished():
	
	if $AnimatedSprite2D.animation == "Death":
		queue_free()
