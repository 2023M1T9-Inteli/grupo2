extends Area2D

#vai para próxima fase do jogo


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Cenas/Mapa_Gantt.tscn")
