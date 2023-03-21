extends Node2D

onready var fase = get_node("/root/CategoriaGlobal")

func _ready():
	fase.level = "fase 3"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
