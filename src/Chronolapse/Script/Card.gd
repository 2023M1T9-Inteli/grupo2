extends RigidBody2D

#variável que auxilia na contagem do tempo até o card desaparecer
var tempo = 0

#variável que auxilia no desaparecimento do card assim que ele entra em contato com a personagem inimiga
var desaparecer_card = false

func _ready():
	#o quanto o card quica
	$".".set_bounce(0.8) #.6
	#o quanto escorrega
	$".".set_friction(.5)
	#o quanto gira
	$".".set_angular_velocity(0)
	#a aceleração com que cai
	$".".set_gravity_scale(8) #2




func _process(delta):
	#acresce delta na variável tempo a cada frame
	tempo += delta
	#quando a variável tempo for maior do que 2, faz desaparecer o card
	if tempo > 2:
		queue_free()



#função chamada assim que o card entra em contato com um body
func _on_Area2D_body_entered(body):
	#se entra em contato com um body pertencente ao grupo tilemap, faz o body desaparecer e põe a variável desaparecerTomate como verdadeira
	if body.is_in_group("tilemap"):
		#desaparecer_card = true
		pass
	
	if body.is_in_group("monster"):
		body.congelar()
		body.mudar_animacao()
		desaparecer_card = true
		
	#se a variável desaparecer_card for verdadeira, o tomate desaparece
	if desaparecer_card:
		queue_free()
