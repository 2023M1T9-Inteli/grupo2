extends Node2D

func _ready():
	pass 

#esconde o pop up quando o botão de x é pressionado:	
func _on_TextureButton_pressed():
	$Sprite.hide()
