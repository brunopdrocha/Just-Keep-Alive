extends CharacterBody2D

const SPEED = 170

@onready var anim = $AnimatedSprite2D  
var current_dir = ""

func _ready() -> void:
	anim.play("Idle Down")
	
func _physics_process(delta: float) -> void:
	player_movement(delta)  
	player_animation()       

func player_movement(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
		current_dir = "Right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
		current_dir = "Left"
	if Input.is_action_pressed("ui_down"):
		velocity.y += SPEED
		current_dir = "Down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= SPEED
		current_dir = "Up"
	
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
				anim.play("Idle Right")
			"Left":
				anim.play("Idle Left")
			"Down":
				anim.play("Idle Down")
			"Up":
				anim.play("Idle Up")
