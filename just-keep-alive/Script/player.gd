extends CharacterBody2D

const SPEED = 170

var IsAttacking = false
@onready var swordstab = $swordstab

@onready var anim = $"Character Walking"
var current_dir = ""

func _ready() -> void:
	anim.play("Idle Right")
	
func _physics_process(delta: float) -> void:
	if not IsAttacking:
		player_movement(delta)  
	player_animation()       
	
	
func perform_attack() -> void:
	IsAttacking = true  # Define que o personagem está atacando

	# Verifica a direção atual e executa o ataque correspondente
	if current_dir == "Right":
		anim.play("Attack Right")
		print("Direita")
	elif current_dir == "Left":
		anim.play("Attack Left")
		print("Esquerda")
	elif current_dir == "Down":
		anim.play("Attack Down")
		print("Baixo")
	elif current_dir == "Up":
		anim.play("Attack Up")
		print("Acima")
		
	swordstab.play()  # Som da espada
	$AttackArea/CollisionShape2D.disabled = false  # Habilita a área de ataque

	# REMOVIDO: A chamada para _on_character_walking_animation_finished() aqui
	# A função será chamada automaticamente quando a animação terminar

func player_movement(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right") and not IsAttacking:
		velocity.x += SPEED
		current_dir = "Right"
	if Input.is_action_pressed("ui_left") and not IsAttacking:
		velocity.x -= SPEED
		current_dir = "Left"
	if Input.is_action_pressed("ui_down") and not IsAttacking:
		velocity.y += SPEED
		current_dir = "Down"
	if Input.is_action_pressed("ui_up") and not IsAttacking:
		velocity.y -= SPEED
		current_dir = "Up"
	
	# Inicia o ataque se o botão for pressionado
	if Input.is_action_just_pressed("Attack") and not IsAttacking:
		perform_attack()
				
	move_and_slide()
func player_animation() -> void:
	# Não altera a animação de movimento se estiver atacando
	if IsAttacking:
		return  # REMOVIDO: perform_attack() aqui

	# Animações de movimento
	if velocity.length() > 0:
		match current_dir:
			"Right":
				anim.play("Walk Right")
			"Left":
				anim.play("Walk Left")
			"Down":
				anim.play("Walk Down")
			"Up":
				anim.play("Walk Up")
	else:
		match current_dir:
			"Right":
				anim.play("Idle Right")
			"Left":
				anim.play("Idle Left")
			"Down":
				anim.play("Idle Down")
			"Up":
				anim.play("Idle Up")

func _on_character_walking_animation_finished() -> void:
	# Verifica se a animação atual é de ataque
	if anim.animation in ["Attack Right", "Attack Left", "Attack Down", "Attack Up"]:
		$AttackArea/CollisionShape2D.disabled = true  # Desabilita a área de ataque
		IsAttacking = false  # Define que o personagem não está mais atacando
