extends Area2D

func _on_Passagem_body_entered(body):
	get_tree().change_scene("res://Cenas/Cena2.tscn")
