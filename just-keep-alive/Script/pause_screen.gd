extends CanvasLayer

func _ready() -> void:
	visible = false # Menu de pausa começa invisível


func _process(delta):
	# Verifica se a tecla de "cancelar" (Esc) foi pressionada
	if Input.is_action_just_pressed("pause"):
		if visible:
			# Se o menu de pausa estiver visível, despausa o jogo e esconde o menu
			visible = false
			get_tree().paused = false
			print("Jogo Despausado")
		else:
			# Se o menu de pausa não estiver visível, pausa o jogo e mostra o menu
			visible = true
			get_tree().paused = true
			print("Jogo Pausado")
