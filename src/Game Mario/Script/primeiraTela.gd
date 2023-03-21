extends Control


var movimento_player = true
#chama a função de tocar musica, para assim tocar a musica principal logo na tela de início
func _ready():
	ControleMusica.play_musica()


#vai para a proxima tela
func _on_startBtn_pressed():
	get_tree().change_scene("res://Cenas/Matriz.tscn")

#aparecer menu de controle e voltar para tela de início se for requerido
func _on_controlBtn_pressed():
	var controlScreen = load("res://control/popUpControl.tscn").instance()
	get_tree().current_scene.add_child(controlScreen) 

#fecha a tela do programa
func _on_quitBtn_pressed():
	get_tree().quit() 

#função para quando inimigo morrer sumir
func die():
	$".".queue_free()



#botao de objetivo do jogo
func _on_objetivoBtn_pressed():
	var objetivoScreen = load("res://Cenas/PopUpObjetivo.tscn").instance()
	get_tree().current_scene.add_child(objetivoScreen)
	print("body")
