extends Node2D
var time_start = 0
var time_now = 0

func _ready():
	time_start = OS.get_unix_time()

func _process(delta):
	time_now = OS.get_unix_time()
	var time_elapsed = time_now - time_start
	$CanvasLayer/ProgressBar.value = 12.5*(time_elapsed)
