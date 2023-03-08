extends RigidBody2D

var tempo = 0
var desaparecerTomate = false

func _ready():
	$".".set_bounce(0.8) #.6
	$".".set_friction(.5)
	$".".set_angular_velocity(20)
	$".".set_gravity_scale(8) #2

func _process(delta):
	tempo += delta
	if tempo > 2:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("monster"):
		body.dano()
		desaparecerTomate = true
	
	if desaparecerTomate:
		queue_free()
