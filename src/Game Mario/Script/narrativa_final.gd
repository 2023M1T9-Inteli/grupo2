extends Node2D


func _ready():
	$Timer1.start()
	$AnimatedSprite.play("anim1")

func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/primeiraTela.tscn")


func _on_Timer1_timeout():
	$Timer2.start()
	$AnimatedSprite.play("anim2")

func _on_Timer2_timeout():
	$Timer3.start()
	$AnimatedSprite.play("anim3")

func _on_Timer3_timeout():
	get_tree().change_scene("res://Cenas/primeiraTela.tscn")
