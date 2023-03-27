extends Control


var movimento_player = true
#chama a função de tocar musica, para assim tocar a musica principal logo na tela de início
func _ready():
	ControleMusica.play_musica()


#vai para a proxima tela
func _on_startBtn_pressed():
	get_tree().change_scene("res://Cenas/Narrativa_inicial.tscn")

#aparecer menu de controle e voltar para tela de início se for requerido
func _on_controlBtn_pressed():
	var control_screen = load("res://control/popUpControl.tscn").instance()
	get_tree().current_scene.add_child(control_screen) 

#fecha a tela do programa
func _on_quitBtn_pressed():
	get_tree().quit() 

#botao de objetivo do jogo
func _on_objetivoBtn_pressed():
	var objetivo_screen = load("res://Cenas/PopUpObjetivo.tscn").instance()
	get_tree().current_scene.add_child(objetivo_screen)
	print("body")
