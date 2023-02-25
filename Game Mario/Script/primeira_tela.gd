extends Control



#coloca o foco de uma cor em um botão para saber onde é o inicio
func _ready():
	$controls/startBtn.grab_focus()


#vai para a proxima tela
func _on_startBtn_pressed():
	get_tree().change_scene("res://Cenas/World.tscn")

#aparecer menu de controle e voltar para tela de início se for requerido
func _on_controlBtn_pressed():
	var controlScreen = load("res://Cenas/ControlScreens.tscn").instance()
	get_tree().current_scene.add_child(controlScreen) 

#fecha a tela do programa
func _on_quitBtn_pressed():
	get_tree().quit() 


