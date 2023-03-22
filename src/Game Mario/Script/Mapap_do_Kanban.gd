extends Node2D

var tempo
onready var fase = get_node("/root/CategoriaGlobal")
onready var categoria = get_node("/root/CategoriaGlobal")
func _ready():
	fase.level = "fase 4"
	if(categoria.categoria == 0): tempo = 150
	elif categoria.categoria == 1: tempo = 225
	elif categoria.categoria == 2: tempo = 180
	elif categoria.categoria == 3: tempo = 120
	else: tempo = 225
	$Player/timer/CanvasLayer/Control.start_timer(tempo)
func _process(delta):
	$Player.morte_queda()
