extends RigidBody2D

var tempo = 0

func _ready():
	$".".set_bounce(0.8) #.6
	$".".set_friction(.5)
	$".".set_angular_velocity(20)
	$".".set_gravity_scale(8) #2

func _process(delta):
	tempo += delta
	if tempo > 2:
		queue_free()
