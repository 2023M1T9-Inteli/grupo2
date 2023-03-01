extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 0.5

# a primeira do relógio(TicTac), pega seu inicio, fim e deixa na primeira posição da imagem 
func _ready():
	$Sprite.play("walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial +  100

#está fazendo com que o a personagem relógio(TicTac) seja processada várias vezes para sua locomoção e mudança de imagem dela
func _process(_delta):
	
	if (posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false

	if ($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true

#quando o persagem principal pular em cima do relógio(TicTac) ele irá morrer(desaparecer da tela)
func dano():
	$".".queue_free()

