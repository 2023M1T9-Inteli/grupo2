extends Node2D


#cena antiga a ser alterada, favor desconsiderar
func _ready():
	pass 


func _process(delta):
	pass

#quando botão é pressionado volta para cena anterior
func _on_returnBtn_pressed():
	queue_free()
	
