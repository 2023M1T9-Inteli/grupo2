extends Node2D
#Variável de controle para saber se o vídeo tutorial deve ser exibido ou não
var video = true

var relogio = preload("res://Cenas/popUpRelogio.tscn").instance()

func _ready():
	$timer/CanvasLayer/Control.start_timer()

func _process(_delta):
	#Verifica se deve mostrar o vídeo
	if(video):
		#Verifica a posição do jogador		
		if($Player.position.x >= 475):
			var posicao_tela = get_viewport()
			#Chama a função do popUp para mostrar o tutorial para o player 
			get_tree().current_scene.add_child(relogio)
			
			
			
			video = false
