extends Sprite

#função para fazer um fade-out para um sprite
func _physics_process(delta):
	modulate.a = lerp(modulate.a,0,0.08) #controla a transparência do sprite. neste caso estamos diminuindo gradualmente o valor alpha usando a função "lerp"
	if (modulate.a < 0.01): #se for menor que 0, o sprite é destruído pela função "queue.free()
		queue_free()
