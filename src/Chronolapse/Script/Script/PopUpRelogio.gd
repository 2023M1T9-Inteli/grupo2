extends CanvasLayer

func _on_Popup_popup_hide():
#	Permite o jogador voltar a andar quanto o popUp estiver fechado
	$".".visible = false
	get_tree().paused = false	
