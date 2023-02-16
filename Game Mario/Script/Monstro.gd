extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.3 

func _ready():
	$Sprite.play("walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial +  100

func _process(delta):
	
	if (posicao_inicial <= posicao_final and flip):
		$".".position.x += 0.3
