extends Node2D

#função que fecha o popup assim que o botão é pressionado
func _on_TextureButton_pressed():
	$quadro.hide()
	$Sprite.hide()
