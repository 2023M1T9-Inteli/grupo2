extends CanvasLayer

#função de avançar para a próxima página do pop up. Elementos da 1° página são escondidos e o da 2° pagina são mostrados
func _on_avancar_pressed():
	
	$Control/WindowDialog/Sprite.hide()
	$Control/WindowDialog/Sprite2.show()
	

#função para volar para página anterior (primeira página)
func _on_voltar1_pressed():
	$Control/WindowDialog/Sprite.show()
	$Control/WindowDialog/Sprite2.hide()


#função de avançar para a próxima página do pop up. Elementos da 2° página são escondidos e o da 3° pagina são mostrados
func _on_avancar2_pressed():
	$Control/WindowDialog/Sprite2.hide()
	$Control/WindowDialog/Sprite3.show()


#função para volar para página anterior (segunda página)
func _on_voltar2_pressed():
	$Control/WindowDialog/Sprite3.hide()
	$Control/WindowDialog/Sprite2.show()

#função que fecha o popup e torna o canvas layer não visível
func _on_WindowDialog_popup_hide():
	self.visible = false
