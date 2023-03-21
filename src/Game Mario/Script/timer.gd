extends Control
export (int) var minutes = 0
export (int) var seconds = 100
var ms = 0

func _ready():
	$Timer.stop()


func _process(delta):
	
	if seconds > 60:
		minutes += seconds/60
		seconds = (seconds%60) * 60

	if seconds > 0 and ms <= 0:
		seconds	-= 1
		ms = 10
	if minutes > 0 and seconds <= 0:
		minutes	-= 1
		seconds = 60
		
	if seconds >= 10:
		$sec.set_text(str(seconds))
	else:
		$sec.set_text("0" + str(seconds))
	if ms >= 10:
		$ms.set_text(str(ms))
	else:
		$ms.set_text("0" + str(ms))
	if minutes >= 10:
		$min.set_text(str(seconds))
	else:
		$min.set_text("0" + str(minutes))
		
	
	if minutes == 0 and seconds == 0 and ms == 0:
		get_tree().change_scene("res://Cenas/GameOver.tscn")
		
	
func _on_Timer_timeout():
	ms -= 1

func _alterSeconds(i):
	seconds -= i

func start_timer(sec):
	seconds = sec
	$Timer.start()
	
func perder_tempo():
	seconds -= 10
