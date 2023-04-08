extends Node2D
#Variável de controle para contar em que animação está
var controle = 1
#Variável que armazena o nome da animação
var animacao 
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
	if controle != 16 && controle != 32:
		controle += 1
	#Caso esteja na 16ª animação, deve trocar de cena, pois já foi passada toda a narrativa dessa cena
	elif controle == 16:
		controle+=1 
		anima2 = true
		$AnimatedSprite.visible = false
		$AnimatedSprite2.visible = true
	elif controle == 32:
		get_tree().change_scene("res://Cenas/Matriz/InicioMatriz.tscn")

#Função para alterar a animação para a próxima
func mudarAnimacao():
	animacao = "anima" + str(controle)
	if !anima2: $AnimatedSprite.play(animacao)
	elif anima2: $AnimatedSprite2.play(animacao)
