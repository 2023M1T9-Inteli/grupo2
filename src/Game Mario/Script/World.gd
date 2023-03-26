extends Node2D
#Variável de controle para saber se o vídeo tutorial deve ser exibido ou não
var video = true
var tempo
var relogio = preload("res://Cenas/popUpRelogio.tscn").instance()
#var quiz1 = preload("res://Cenas/quiz1.tscn").instance()
onready var mov = get_node("/root/GlobalTeste")
onready var categoria = get_node("/root/CategoriaGlobal")

func _ready():
#	Atribui um valor para o tempo que o jogador tem, baseado no desempenho da matriz
	if(categoria.categoria == 0): tempo = 150
	elif categoria.categoria == 1: tempo = 225
	elif categoria.categoria == 2: tempo = 180
	elif categoria.categoria == 3: tempo = 120
	else: tempo = 225
#	Invoca o timer e passa quanto tempo ele deve ter
	$Player/timer/CanvasLayer/Control.start_timer(tempo)
	
func _process(_delta):
	if video:
		if($Player.position.x >= 475 and $Player.position.x <=500):
			#Chama a função do popUp para mostrar o tutorial para o player 
			mov.movimento_player = false
			get_tree().current_scene.add_child(relogio)
			video = false
	$Player.morte_queda()
#	if ($Player.position.x >= 1050):
#		get_tree().current_scene.add_child(quiz1)
#		mov.movimento_player = false
