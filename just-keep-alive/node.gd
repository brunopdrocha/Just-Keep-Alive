extends Node


var players_coin = 0

func _ready():
	

func _input(event):

	if Input.is_action_pressed("pause"):
		get_tree().paused = true

	if Input.is_action_pressed("unpause"):
		get_tree().paused = false
