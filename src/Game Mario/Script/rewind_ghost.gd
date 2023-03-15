extends Sprite

#função para fazer um fade-out para um sprite
func _physics_process(_delta):
	
	#controla a transparência do sprite. neste caso estamos diminuindo gradualmente o valor alpha usando a função "lerp"
	modulate.a = lerp(modulate.a,0,0.2) 
	
	#se for menor que 0, o sprite é destruído pela função "queue.free()
	if (modulate.a < 0.01): 
		queue_free()
