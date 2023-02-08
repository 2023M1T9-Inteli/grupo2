extends Node2D

var entrou = 0

func _ready():
	pass # Replace with function body.


func _process(delta):
	if(entrou == 0):
		$instagram.move_local_x(1)
		$netflix.move_local_x(-1)
	
	if $instagram.position.x == $CyborgReduzida50.position.x || $netflix.position.x == $CyborgReduzida50.position.x + ($CyborgReduzida50.texture.get_width()/2) : 
		$perdeu.text =  "Você acabou de perder todo seu tempo!"
		entrou = 1
