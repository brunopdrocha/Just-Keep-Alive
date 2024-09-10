extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/gameplay.tscn")
	StartGameMusic.stop()
	print("Playing Game")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
	print("Scene Credits")


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
	print("Exit Game")
