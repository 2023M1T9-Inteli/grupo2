extends Node2D
#Variável de controle para contar em que animação está
var controle = 1
#Variável que armazena o nome da animação
var animacao 

func _ready():
#	Começa a tocar a primeira animação e inicia o timer de troca de sprites
	$AnimatedSprite.play("anima1")
	$Timer.start()
	
func _on_Timer_timeout():
	controlar()
	mudarAnimacao()
#	Volta o timer para poder continuar a troca de animações
	$Timer.start()

#Função para pular a narrativa e ir direto a ao jogo
func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/InicioMatriz.tscn")
	
#Função para manter incrementar a variável de controles de animação, invocada quando acaba a animação
func controlar():
	if controle != 16:
		controle += 1
	#Caso esteja na 16ª animação, deve trocar de cena, pois já foi passada toda a narrativa dessa cena
	elif controle == 16:
		get_tree().change_scene("res://Cenas/NarrativaInicial2.tscn")

#Função para alterar a animação para a próxima
func mudarAnimacao():
	animacao = "anima" + str(controle)
	$AnimatedSprite.play(animacao)
