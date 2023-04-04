extends Node2D
#Variável de contagem de erros
var cont = 0

#Mostra as labels das perguntas e suas alternativas, além de esconder as telas de acerto e erro
func _ready():
	$perguntas.show()
	$erro.hide()
	$acerto.hide()
	

#Caso o jogador errar mais de três vezes, a fase é reiniciada.
func _process(delta):
	if cont ==2:
		get_tree().change_scene("res://Cenas/GameOver.tscn")

#muda de cena caso pressione o botão para voltar à tela inicial (como essa é provisioramente a ultima cena, colocamos para retornar ao início, mas há previsões para modificação)		
func _on_avancar_pressed():
	get_tree().change_scene("res://Cenas/narrativa_final.tscn")

#Caso o botão com a resposta certa seja pressionado, aparecerá a tela de acerto e sumirá a tela de perguntas
func _on_Button4_pressed():
	$perguntas.hide()
	$erro.show()
	cont+=1

#Caso o botão com a resposta errada seja pressionado, aparecerá a tela de erro e sumirá a tela de perguntas
#Além disso, será adicionado um a variável de contagem de erros.
func _on_Button3_pressed():
	ControleMusica.respostaCerta()
	$perguntas.hide()
	$acerto.show()
#Caso o botão com a resposta errada seja pressionado, aparecerá a tela de erro e sumirá a tela de perguntas
#Além disso, será adicionado um a variável de contagem de erros.
func _on_Button2_pressed():
	$perguntas.hide()
	$erro.show()
	cont+=1
	
#Caso o botão com a resposta errada seja pressionado, aparecerá a tela de erro e sumirá a tela de perguntas
#Além disso, será adicionado um a variável de contagem de erros.
func _on_Button_pressed():
	$perguntas.hide()
	$erro.show()
	cont+=1

#Caso seja clicado no botão da tela de erros, voltará a tela de perguntas para responder novamente
func _on_TextureButton_pressed():
	$erro.hide()
	$perguntas.show()
