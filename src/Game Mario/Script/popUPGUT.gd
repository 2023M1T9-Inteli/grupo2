extends CanvasLayer

		
#função de avançar para a próxima página do pop up. Elementos da 1° página são escondidos e o da 2° pagina são mostrados
func _on_avancar_pressed():
	$popup/pag1.hide()
	$popup/pag2.show()

#função que fecha o popup e torna o canvas layer não visível	
func _on_WindowDialog_popup_hide():
	self.visible = false

#função de voltar para a página anterior do pop up. Elementos da 2° página são escondidos e o da 1° pagina são mostrados
func _on_voltar1_pressed():
	$popup/pag1.show()
	$popup/pag2.hide()


#função de avançar para a próxima página do pop up. Elementos da 2° página são escondidos e os da 3° pagina são mostrados
func _on_avancar2_pressed():
	$popup/pag2.hide()
	$popup/pag3.show()

#função de voltar para a página anterior do pop up. Elementos da 3° página são escondidos e o da 2° pagina são mostrados
func _on_voltar2_pressed():
	$popup/pag2.show()
	$popup/pag3.hide()
