extends Node

var is_rewinding = false #indica se o jogo está sendo rebobinado no momento
var rewind_length = (60 * 3) #3 segundos de duração
var count = 0; #contador
var DATA = [] #lista vazia que será usada para armazenar os dados de rebobinamento para cada objeto no grupo "rewind"
var rewind_objects # lista de todos os objetos na cena que pertencem ao grupo "rewind"

var rewind_ghost = load("res://Cenas/rewind_ghost.tscn") #cena que será usada para criar efeitos visuais durante o rebobinamento.

#inicializa a lista DATA com uma lista para cada objeto em rewind_objects
func _ready():
	rewind_objects = get_tree().get_nodes_in_group("rewind")
	for mem in rewind_objects:
		DATA.push_back([mem.name])


#se apertado a tecla "espaço", o rebobinamento é acionado
func handle_rewind_objects():
	if(Input.is_action_pressed("ui_space")):
		is_rewinding = true
		for mem in rewind_objects:
			var data = DATA[count]
			if(data.size() > 1):
				var current_frame = data[0]
				var ani = mem.get_node("Sprite")
				
				#Definir a animação/posição/direção de nossos objetos
				ani.animation = current_frame[0]
				mem.global_position = current_frame[1]
				ani.flip_h = current_frame[1]
				
				#efeito fantasma do sprite (fade-out)
				var ghost : Sprite = rewind_ghost.instance()
				ghost.texture = ani.frames.get_frame(ani.animation,ani.frame)
				ghost.global_position = mem.global_position
				ghost.flip_h = ani.flip_h
				get_parent().add_child(ghost)
				
				#remove o primeiro frame ja que acabamos de usá-lo
				data.pop_front()
				count += 1
		count = 0
	
	#grava os dados para o rebobinamento
	else:
		is_rewinding = false
		for mem in rewind_objects:
			var data = DATA[count]
			var ani = mem.get_node("Sprite")
			data.push_front([ani.animation,mem.global_position,ani.flip_h])
			count += 1
			
			#se o registro tiver mais de 3 segundos, remova o último quadro
			if(data.size() > rewind_length): 
				data.pop_back()
		count = 0
		pass
		
# chama handle_rewind_objects() a cada quadro.		
func _physics_process(delta):
	handle_rewind_objects()






