extends Node2D


onready var fase = get_node("/root/CategoriaGlobal")

func _ready():
	fase.level = "fase 4"

func _process(delta):
	$Player.morte_queda()
