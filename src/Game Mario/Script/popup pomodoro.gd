extends Node2D


# função que mostra o pop up do pomodoro. Versão mais antiga sobre pop ups que futuramente será substituida por pop up
# nessa tela, os elementos da "1° página" sobre o método omodoro é mostrada, junto com as setas para avançar e o botão de fechar
func _ready():
	$Quizz/X3.hide()
	$Quizz/tabela.hide()
	$Quizz/Label3.hide()
	$Quizz/Label4.hide()
	$Quizz/Pomodoro2.hide()
	$Quizz/voltar.hide()
	$Quizz/voltar2.hide()

# função acionada caso o usuário aperte o x, fechando o pop up
func _on_X_pressed():
	$Quizz.hide()
	

#função de avançar para a próxima página do pop up. Elementos da 1° página são escondidos e o da 2° pagina são mostrados
func _on_X2_pressed():
	$Quizz/Pomodoro1.hide()
	$Quizz/Label.hide()
	$Quizz/tabela.show()
	$Quizz/X2.hide()
	$Quizz/X3.show()
	$Quizz/voltar.show()
	
# #função de avançar para a próxima página do pop up. Elementos da 2° página são escondidos e o da 3° pagina são mostrados
func _on_X3_pressed():
	$Quizz/Label3.show()
	$Quizz/X3.hide()
	$Quizz/tabela.hide()
	$Quizz/Label4.show()
	$Quizz/Pomodoro2.show()
	$Quizz/voltar.hide()
	$Quizz/voltar2.show()

# função de voltar para a página anterior. Elementos da página posterior são escondidos e o da página anterior são mostrados
func _on_voltar_pressed():
	$Quizz/Pomodoro1.show()
	$Quizz/Label.show()
	$Quizz/tabela.hide()
	$Quizz/X2.show()
	$Quizz/X3.hide()
	$Quizz/voltar.hide()


# função de voltar para a página anterior. Elementos da página posterior são escondidos e o da página anterior são mostrados
func _on_voltar2_pressed():
	$Quizz/Label3.hide()
	$Quizz/X3.show()
	$Quizz/tabela.show()
	$Quizz/Label4.hide()
	$Quizz/Pomodoro2.hide()
	$Quizz/Label.hide()
	$Quizz/Pomodoro1.hide()
	$Quizz/voltar.show()
	$Quizz/voltar2.hide()
