extends Panel

var time: float = 0.0
var minutes: int = Global.minutes
var seconds: int = Global.seconds
var msec: int = Global.msec

func _process(delta) -> void:
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$VBoxContainer/HBoxContainer/Minutes.text = "%02d:" % minutes
	$VBoxContainer/HBoxContainer/Seconds.text = "%02d." % seconds
	$VBoxContainer/HBoxContainer/MSecs.text = "%03d" % msec
	
	Global.minutes = minutes
	Global.seconds = seconds
	Global.msec = msec

func stop() -> void:

	set_process(false)
	print(Global.minutes)
func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds, msec]
