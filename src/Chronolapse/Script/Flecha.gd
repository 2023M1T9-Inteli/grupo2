extends RigidBody2D

#variável que auxilia na contagem do tempo até a flecha desaparecer
var tempo = 0

#variável que auxilia no desaparecimento da flecha assim que ele entra em contato com a personagem inimiga
var desaparecer_flecha = false

#variável que referencia o script global
onready var global = get_node("/root/GlobalTeste")

func _ready():
	#põe a animação "default" como animação inicial
	$AnimatedSprite.play("default")


func _process(delta):
	#desabilita a gravidade sobre a flecha
	gravity_scale = 0
	#acresce delta na variável tempo a cada frame
	tempo += delta
	#quando a variável tempo for maior do que 0.6, faz mudar a animação da flecha
	if tempo > 0.6:
		$AnimatedSprite.play("new")
		if CategoriaGlobal.direcao_do_jogador == true:
			linear_velocity = Vector2(0, 0)
		else:
			linear_velocity = Vector2(0, 0)
	
	#se a variável tempo for maior do que 0.7, faz desaparecer a flecha
	if tempo > 0.7:
		queue_free()



#função chamada assim que a flecha entra em contato com um body
func _on_Area2D_body_entered(body):
	#se entra em contato com um body pertencente ao grupo monster, faz o body desaparecer e põe a variável desaparecer_flecha como verdadeira
	if body.is_in_group("monster"):
		body.dano()
		desaparecer_flecha = true
	#se entra em contato com um body pertencente ao grupo tilemap, põe a variável desaparecer_flecha como verdadeira
	if body.is_in_group("tilemap"):
		desaparecer_flecha = true
	
	#se a variável desaparecer_flecha for verdadeira, a flecha desaparece
	if desaparecer_flecha:
		queue_free()
