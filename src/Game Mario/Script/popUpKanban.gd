extends CanvasLayer

#função de avançar para a próxima página do pop up. Elementos da 1° página são escondidos e o da 2° pagina são mostrados
func _on_avancar_pressed():
	
	$Control/WindowDialog/Sprite.hide()
	$Control/WindowDialog/Sprite2.show()
	



func _on_voltar1_pressed():
	$Control/WindowDialog/Sprite.show()
	$Control/WindowDialog/Sprite2.hide()



func _on_avancar2_pressed():
	$Control/WindowDialog/Sprite2.hide()
	$Control/WindowDialog/Sprite3.show()



func _on_voltar2_pressed():
	$Control/WindowDialog/Sprite3.hide()
	$Control/WindowDialog/Sprite2.show()


func _on_WindowDialog_popup_hide():
	self.visible = false
