extends Node2D
#Variável de controle para saber se o vídeo tutorial deve ser exibido ou não
var video = true
var tempo
var relogio = preload("res://Cenas/popUpRelogio.tscn").instance()
#var quiz1 = preload("res://Cenas/quiz1.tscn").instance()
onready var mov = get_node("/root/GlobalTeste")
onready var categoria = get_node("/root/CategoriaGlobal")

func _ready():
	if(categoria.categoria == 0): tempo = 150
	elif categoria.categoria == 1: tempo = 225
	elif categoria.categoria == 2: tempo = 180
	elif categoria.categoria == 3: tempo = 120
	else: tempo = 225
	$timer/CanvasLayer/Control.start_timer(tempo)
	pass
func _process(_delta):
	if video:
		if($Player.position.x >= 475 and $Player.position.x <=500):
			#Chama a função do popUp para mostrar o tutorial para o player 
			mov.movimento_player = false
			get_tree().current_scene.add_child(relogio)
			video = false
#	if ($Player.position.x >= 1050):
#		get_tree().current_scene.add_child(quiz1)
#		mov.movimento_player = false
