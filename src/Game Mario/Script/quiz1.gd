extends Node2D

# variável que instancia script global 
onready var andar_player = get_node("/root/GlobalTeste")
func _ready():
	$Popup.popup()
	

#Função para quando o pop for fechado
func _on_Popup_popup_hide():
#	Encerrar a cena
	queue_free()
