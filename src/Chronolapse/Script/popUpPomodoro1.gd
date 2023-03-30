extends CanvasLayer
		
#função de avançar para a próxima página do pop up. Elementos da 1° página são escondidos e os da 2° pagina são mostrados
func _on_avancar_pressed():
	$WindowDialog/Sprite.hide()
	$WindowDialog/Sprite2.show()

#função que fecha o popup e torna o canvas layer não visível	
func _on_WindowDialog_popup_hide():
	self.visible = false
	get_tree().paused = false	

	
#função de voltar para a página anterior do pop up. Elementos da 2° página são escondidos e o da 1° pagina são mostrados
func _on_voltar1_pressed():
	$WindowDialog/Sprite.show()
	$WindowDialog/Sprite2.hide()


#função de avançar para a próxima página do pop up. Elementos da 2° página são escondidos e os da 3° pagina são mostrados
func _on_avancar2_pressed():
	$WindowDialog/Sprite2.hide()
	$WindowDialog/Sprite3.show()

#função de voltar para a página anterior do pop up. Elementos da 3° página são escondidos e o da 2° pagina são mostrados
func _on_voltar2_pressed():
	$WindowDialog/Sprite2.show()
	$WindowDialog/Sprite3.hide()
