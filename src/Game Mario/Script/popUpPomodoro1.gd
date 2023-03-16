extends Node2D


func _ready():
##	$Popup.popup()
	$WindowDialog.popup_centered()
	
#função de avançar para a próxima página do pop up. Elementos da 1° página são escondidos e o da 2° pagina são mostrados
func _on_avancar_pressed():
	$WindowDialog/Sprite.hide()
	$WindowDialog/Sprite2.show()
	
func _on_WindowDialog_popup_hide():
	queue_free()


func _on_voltar1_pressed():
	$WindowDialog/Sprite.show()
	$WindowDialog/Sprite2.hide()



func _on_avancar2_pressed():
	$WindowDialog/Sprite2.hide()
	$WindowDialog/Sprite3.show()



func _on_voltar2_pressed():
	$WindowDialog/Sprite2.show()
	$WindowDialog/Sprite3.hide()
