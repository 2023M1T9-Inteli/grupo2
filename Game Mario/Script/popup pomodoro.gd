extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Quizz/X3.hide()
	$Quizz/tabela.hide()
	$Quizz/Label3.hide()
	$Quizz/Label4.hide()
	$Quizz/Pomodoro2.hide()
	$Quizz/voltar.hide()
	$Quizz/voltar2.hide()

func _on_X_pressed():
	$Quizz.hide()
	


func _on_X2_pressed():
	$Quizz/Pomodoro1.hide()
	$Quizz/Label.hide()
	$Quizz/tabela.show()
	$Quizz/X2.hide()
	$Quizz/X3.show()
	$Quizz/voltar.show()
	


func _on_X3_pressed():
	$Quizz/Label3.show()
	$Quizz/X3.hide()
	$Quizz/tabela.hide()
	$Quizz/Label4.show()
	$Quizz/Pomodoro2.show()
	$Quizz/voltar.hide()
	$Quizz/voltar2.show()


func _on_voltar_pressed():
	$Quizz/Pomodoro1.show()
	$Quizz/Label.show()
	$Quizz/tabela.hide()
	$Quizz/X2.show()
	$Quizz/X3.hide()
	$Quizz/voltar.hide()


func _on_voltar2_pressed():
	$Quizz/Label3.hide()
	$Quizz/X3.show()
	$Quizz/tabela.show()
	$Quizz/Label4.hide()
	$Quizz/Pomodoro2.hide()
	$Quizz/Label.hide()
	$Quizz/Pomodoro1.hide()
	$Quizz/voltar.show()
	$Quizz/voltar2.hide()
