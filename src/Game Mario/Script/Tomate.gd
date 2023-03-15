extends RigidBody2D

#variável que auxilia na contagem do tempo até o tomate desaparecer
var tempo = 0

#variável que auxilia no desaparecimento do tomate assim que ele entra em contato com a personagem inimiga
var desaparecer_tomate = false

func _ready():
	#o quanto o tomate quica
	$".".set_bounce(0.8) #.6
	#o quanto escorrega
	$".".set_friction(.5)
	#o quanto gira
	$".".set_angular_velocity(20)
	#a aceleração com que cai
	$".".set_gravity_scale(8) #2



func _process(delta):
	#acrese delta na variável tempo a cada frame
	tempo += delta
	#quando a variável tempo for maior do que 2, faz desaparecer o tomate
	if tempo > 2:
		queue_free()



#função chamada assim que o tomate entra em contato com um body
func _on_Area2D_body_entered(body):
	#se entra em contato com um body pertencente ao grupo monster, faz o body desaparecer e põe a variável desaparecerTomate como verdadeira
	if body.is_in_group("monster"):
		body.dano()
		desaparecer_tomate = true
	
	#se a variável desaparecerTomate for verdadeira, o tomate desaparece
	if desaparecer_tomate:
		queue_free()
