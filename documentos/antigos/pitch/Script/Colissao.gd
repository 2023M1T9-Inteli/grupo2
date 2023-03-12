extends Node2D

var entrou = 0

func _ready():
	pass # Replace with function body.


func _process(delta):
	if(entrou == 0):
		$instagram.move_local_x(1) # mover da esquerda para direita 
		$netflix.move_local_x(-1) # move icone da direita para esquerda 
	
	if $instagram.position.x == $CyborgReduzida50.position.x || $netflix.position.x == $CyborgReduzida50.position.x + ($CyborgReduzida50.texture.get_width()/2) : #condicao que verifica se os objetos atingiram a persagem, no caso o cyborg
		$perdeu.text =  "Você acabou de perder todo seu tempo! :(" #label para aparecer quando os icones atingem o personagem
		entrou = 1 #serve para não entrar mais no if de cima, pois assim os icones irão parar quando chegarem no personagem;
	
