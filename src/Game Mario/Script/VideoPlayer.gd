extends VideoPlayer        

func _ready():          
	set_process(true)

func _process(delta):
	if not is_playing():
		play()
