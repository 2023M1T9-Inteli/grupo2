extends KinematicBody2D

#variável que auxilia na contagem do tempo até o card desaparecer
var tempo = 0

#variável que auxilia no desaparecimento do card assim que ele entra em contato com a personagem inimiga
var desaparecer_card = false

func _ready():
	pass



func _process(delta):
	#acresce delta na variável tempo a cada frame
	tempo += delta
	#quando a variável tempo for maior do que 2, faz desaparecer o card
	if tempo > 0.5:
		queue_free()



#função chamada assim que o card entra em contato com um body
func _on_Area2D_body_entered(body):
	#se entra em contato com um body pertencente ao grupo tilemap, faz o body desaparecer e põe a variável desaparecerTomate como verdadeira
	if body.is_in_group("tilemap"):
		#desaparecer_card = true
		pass
	
	#se a variável desaparecer_card for verdadeira, o tomate desaparece
	if desaparecer_card:
		queue_free()
