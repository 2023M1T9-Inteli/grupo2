extends VideoPlayer        

func _ready():          
	set_process(true)

#função mostra o video(poupup) 
func _process(delta):
	if not is_playing():
		play()
