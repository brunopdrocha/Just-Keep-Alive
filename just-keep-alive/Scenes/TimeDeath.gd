extends Panel

# Chamada ao entrar na árvore da cena
func _ready() -> void:
	$VBoxContainer/HBoxContainer/Minutes.text = str(Global.minutes).pad_zeros(2) +":"
	$VBoxContainer/HBoxContainer/Seconds.text = str(Global.seconds).pad_zeros(2) +":"
	$VBoxContainer/HBoxContainer/MSecs.text = str(Global.msec).pad_zeros(2)
