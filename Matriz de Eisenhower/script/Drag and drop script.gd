extends Sprite

var mouse_in = false #Variavel usada para verificar se o mouse entrou na CollisionShape2D
var dragging = false #Variavel usada para verificar se o CollisionShape2D está sendo arrastado

func _process(delta):
	#Verifica se o botão esquerdo do mouse é pressionado enquanto dentro da CollisionShape2d
	if (mouse_in && Input.is_action_pressed("click")): 
		#Muda a variável para "true" para confirmar que está sendo movido
		dragging = true 
 
	#verifica se o mouse está em movimento enquanto pressionado
	if (dragging && Input.is_action_pressed("click")): 
		#define a variável position para a posição do mouse
		var position = get_viewport().get_mouse_position() 

		 #define o posicionamento do sprite para o posicionamento do mouse
		set_position(position) 
	else:
		#define que o mouse não está em movimento enquanto pressionado
		dragging = false 


func _on_Area2D_mouse_entered():
 #Verifica se o mouse entrou na CollisionShape2D
	mouse_in = true 


func _on_Area2D_mouse_exited():
	#Verifica se o mouse saiu da CollisionShape2D
	mouse_in = false 
