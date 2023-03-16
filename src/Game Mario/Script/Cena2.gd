extends Node

#varíavel que referencia a cena do tomate arremessável
var tomate = preload("res://Cenas/Tomate.tscn")

#variável que referencia e instancia a cena do player
var jogador = preload("res://Branch/Player.tscn").instance()

var popup = preload("res://Cenas/popUpPomodoro1.tscn").instance()

#variável booleana que indica se o jogador já pode atirar
var pode_atirar = false



func _ready():
	#adiciona a cena do player, que foi instanciada, na cena atual 
	add_child(jogador)
	
	#animação padrão para o bloco
	$Bloco_Tomate/AnimatedSprite.play("default")

func _process(_delta):
	#chama continuamente a função 'atirar_tomate'
	atirar_tomate()
	
	
	
#função 'atirar_tomate' responsável pela mecânica de atirar tomates
#é chamada apenas pelo _process da cena2
func atirar_tomate():
	#a função só retorna algo se o botão ui_atirar for pressionado e se a variável 'podeAtirar' for verdadeira
	if Input.is_action_just_pressed("ui_atirar") and pode_atirar:

		#intancia a cena tomate e joga dentro da variável cena_tomate
		var cena_tomate = tomate.instance()
		
		#se o sprite da personagem estiver voltado para a esquerda, o tomate vai para a esquerda
		if $Player/Sprite.flip_h == true:
			cena_tomate.position = Vector2($Player.position.x - 55, $Player.position.y)
			cena_tomate.linear_velocity = (Vector2(-550, 40))
		
		#senão, o tomate vai para a direita
		else:
			cena_tomate.position = Vector2($Player.position.x + 55, $Player.position.y)
			cena_tomate.linear_velocity = (Vector2(550, 40))
		
		#adiciona a cena do Tomate, que foi instanciada, na cena atual
		get_tree().current_scene.add_child(cena_tomate)



#função chamada assim que o player interage com o Bloco_Tomate
func _on_Area2D_body_entered(body):
	#muda a animação do Bloco
	get_node("Bloco_Tomate").get_node("AnimatedSprite").play("new_default")
	$blocoFx.play()
	#muda a variável 'podeAtirar' para true, permitindo a função atirar_tomate retornar algo
	pode_atirar = true
	add_child(popup)
