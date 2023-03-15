extends Node

#varíavel que referencia a cena do tomate arremessável
var Tomate = preload("res://Cenas/Tomate.tscn")

#variável que referencia e instancia a cena do player
var jogador = preload("res://Branch/Player.tscn").instance()

#variável booleana que indica se o jogador já pode atirar
var podeAtirar = false



func _ready():
	#adiciona a cena do player, que foi instanciada, na cena atual 
	add_child(jogador)
	
	#animação padrão para o bloco
	$Bloco_Tomate/AnimatedSprite.play("default")
	
	#esconde o pop-up referente ao Bloco_Tomate
	$Node2D.hide()



func _process(_delta):
	#chama continuamente a função 'atirar_tomate'
	atirar_tomate()
	
	
	
#função 'atirar_tomate' responsável pela mecânica de atirar tomates
#é chamada apenas pelo _process da cena2
func atirar_tomate():
	#a função só retorna algo se o botão ui_atirar for pressionado e se a variável 'podeAtirar' for verdadeira
	if Input.is_action_just_pressed("ui_atirar") and podeAtirar:
		
		#intancia a cena Tomate e joga dentro da variável tomate
		var tomate = Tomate.instance()
		
		#se o sprite da personagem estiver voltado para a esquerda, o tomate vai para a esquerda
		if $Player/Sprite.flip_h == true:
			tomate.position = Vector2($Player.position.x - 55, $Player.position.y)
			tomate.linear_velocity = (Vector2(-550, 40))
		
		#senão, o tomate vai para a direita
		else:
			tomate.position = Vector2($Player.position.x + 55, $Player.position.y)
			tomate.linear_velocity = (Vector2(550, 40))
		
		#adiciona a cena do Tomate, que foi instanciada, na cena atual
		add_child(tomate)



#função chamada assim que o player interage com o Bloco_Tomate
func _on_Area2D_body_entered(body):
	#muda a animação do Bloco
	get_node("Bloco_Tomate").get_node("AnimatedSprite").play("new_default")
	
	#muda a variável 'podeAtirar' para true, permitindo a função atirar_tomate retornar algo
	podeAtirar = true
	
	#torna visível o pop-up referente ao Bloco_Tomate
	$Node2D.show()
