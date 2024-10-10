extends CharacterBody2D

const SPEED = 170

var IsAttacking = false;
@onready var swordstab = $swordstab

@onready var anim = $"Character Walking"
var current_dir = ""

func _ready() -> void:
	anim.play("Idle Down")
	
func _physics_process(delta: float) -> void:
	player_movement(delta)  
	player_animation()       

func player_movement(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right") && IsAttacking == false:
		velocity.x += SPEED
		current_dir = "Right"
	if Input.is_action_pressed("ui_left") && IsAttacking == false:
		velocity.x -= SPEED
		current_dir = "Left"
	if Input.is_action_pressed("ui_down") && IsAttacking == false:
		velocity.y += SPEED
		current_dir = "Down"
	if Input.is_action_pressed("ui_up") && IsAttacking == false:
		velocity.y -= SPEED
		current_dir = "Up"

	if IsAttacking == false:
		$"Character Walking".play("Idle Down");
		
	if  Input.is_action_just_pressed("Attack"):
		$"Character Walking".play("Attack right");
		swordstab.play()
		current_dir == "Right"
		IsAttacking = false;
		$AttackArea/CollisionShape2D.disabled 	= false;
	
	move_and_slide()	
	
	

func player_animation() -> void:
	# Movement Animation
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
				anim.play("new_animationIdle Right")
			"Left":
				anim.play("Idle Left")
			"Down":
				anim.play("Idle Down")
			"Up":
				anim.play("Idle Up")


	


func _on_character_walking_animation_finished() -> void:
	if $"Character Walking".animation == "attack right":
		$AttackArea/CollisionShape2D.disabled = true;
		IsAttacking = false;
