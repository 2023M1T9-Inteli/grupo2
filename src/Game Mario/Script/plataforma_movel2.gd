extends Node2D

onready var platform = $moving_platform #define plataforma
onready var tween = $Tween


export var horizontal  = true #define a condição de movimento
export var distancia  = 192 #define a distância que a plataforma vai se mover
var move_direction #direção da plataforma
var duration = 3#duração do movimento

const WAIT_DURATION = 1 #duração do delay da plataforma

#chama a função _start_tween()
func _ready():
	_start_tween()

#define as propriedades de moviemento da plataforma
func _start_tween():
	#move a plataforma para cima
	if horizontal:  
		move_direction = Vector2.RIGHT * distancia
		
	#faz a plataforma se movimentar. Realiza a interpolação dos frames na animação do movimento da plataforma, nos seguintes parâmetros:
	#-objeto a ser animado
	#-parâmentro a ser modificado na animação
	#-parâmentro inicial
	#-parâmetro final
	#-duração
	#-tipo de transição
	#suavização do movimento
	#-delay
	tween.interpolate_property(
		platform,"position", Vector2.ZERO,move_direction,duration,
		Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,WAIT_DURATION
	)
	#realiza a mesma função do anterior, porém para voltar
	tween.interpolate_property(
		platform,"position", move_direction,Vector2.ZERO,duration, 
		Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,duration + WAIT_DURATION *2
	)
	#inicia a animação
	tween.start()
	
