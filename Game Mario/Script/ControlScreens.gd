extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	set_process(true)

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if Input.is_action_pressed("key_exit"):
#		get_tree().quit()
		
			
#quando botão é pressionado volta para cena anterior
func _on_returnBtn_pressed():
	queue_free()
