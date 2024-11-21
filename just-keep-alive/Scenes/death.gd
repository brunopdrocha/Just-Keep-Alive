extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_try_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/gameplay.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
