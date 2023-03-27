extends Node2D

# variável que instancia script global para referir ao movimento do personagem
onready var player = get_node("/root/GlobalTeste")

#função qeu abre o popup
func _ready():
	$Popup.popup()
	

func _on_Popup_popup_hide():
#	Permite o jogador voltar a andar quanto o popUp estiver fechado
	player.movimento_player = true
	queue_free()
