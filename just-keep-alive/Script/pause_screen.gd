extends CanvasLayer

# Chama quando o nó entra na árvore de cena
func _ready() -> void:
	get_tree().paused

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/gameplay.tscn")
	
func _on_surrender_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tela_inicial.tscn")



func _on_restart_button_pressed() -> void:
	get_tree().paused = false  # Certifique-se de que o jogo não está pausado
	get_tree().change_scene_to_file("res://Scenes/gameplay.tscn")
	get_tree().reload_current_scene()  # Recarrega a cena de gameplay
