extends Area2D

#vai para próxima fase do jogo
func _on_Passagem_body_entered(_body):
	get_tree().change_scene("res://Cenas/QuizMatriz.tscn")
