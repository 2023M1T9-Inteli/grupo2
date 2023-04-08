#Script feito para a cena da narrativa inicial
#Duplicado devido ao fato de que a troca de cenas após finalizar as animaçoes é diferente da narrativa final
extends Node2D
#Variável de controle para contar em que animação está
var controle = 1
#Variável que armazena o nome da animação
var animacao 
#Variavel para saber em qual animatedSprite está
var anima2 = false 

func _ready():
	ControleMusica.mute()
#	Começa a tocar a primeira animação e inicia o timer de troca de sprites
	$AnimatedSprite.play("anima1")
	$Timer.start()
	ControleMusica.som()
	
func _on_Timer_timeout():
	controlar()
	mudarAnimacao()
#	Volta o timer para poder continuar a troca de animações
	$Timer.start()
	
#Função para manter incrementar a variável de controles de animação, invocada quando acaba a animação
func controlar():
	#Caso não tenha acabado ou trocado de animação
	if controle != 16 && controle != 32:
		controle += 1
	#Caso esteja na 16ª animação, deve trocar de animação, pois já foi passada toda a narrativa dessa animação
	elif controle == 16:
		controle+=1 
		#Segundo animeatedSprite é ativado, assim deixando a variável verdadeira.
		anima2 = true
		$AnimatedSprite.visible = false
		$AnimatedSprite2.visible = true
	elif controle == 32:
		#Caso tenha acabado todas as animações 
		get_tree().change_scene("res://Cenas/Matriz/InicioMatriz.tscn")

#Função para alterar a animação para a próxima
func mudarAnimacao():
	#Atribui o nome da animação à variável 
	animacao = "anima" + str(controle)
	#Verifica se está no primeiro ou segundo animatedSprite
	if !anima2: $AnimatedSprite.play(animacao)
	elif anima2: $AnimatedSprite2.play(animacao)


#Função para pular a narrativa e ir direto a ao jogo
func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Matriz/InicioMatriz.tscn")
