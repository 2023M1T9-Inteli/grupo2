extends Node2D

var fechou = false
#função que fecha o popup assim que o botão é pressionado
func _on_TextureButton_pressed():
	$".".visible = false
	fechou = true
