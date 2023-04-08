extends Control


var movimento_player = true
#chama a função de tocar musica, para assim tocar a musica principal logo na tela de início
func _ready():
	ControleMusica.play_musica()
	$PopUpControl.visible = false
	$Objetivo.visible = false
	
func _process(_delta):
	CategoriaGlobal.trocaFase()
#vai para a proxima tela
func _on_startBtn_pressed():
	ControleMusica.mute()
	ControleMusica.botao_start()
	get_tree().change_scene("res://Cenas/Narrativa/NarrativaInicial.tscn")

#aparecer menu de controle e voltar para tela de início se for requerido
func _on_controlBtn_pressed():
	$PopUpControl.visible = true
	#efeito sonoro
	ControleMusica.blocoFx()
#fecha a tela do programa
func _on_quitBtn_pressed():
	get_tree().quit() 

#botao de objetivo do jogo
func _on_objetivoBtn_pressed():
	
	#efeito sonoro
	ControleMusica.blocoFx()
	
	$Objetivo.visible = true
	
	
func _on_credBtn_pressed():
	ControleMusica.blocoFx()
	$Creditos.visible = true
