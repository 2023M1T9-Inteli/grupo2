extends Sprite

var mouse_in = false #Variavel usada para verificar se o mouse entrou na CollisionShape2D
var dragging = false #Variavel usada para verificar se o CollisionShape2D está sendo arrastado

func _process(delta):
 if (mouse_in && Input.is_action_pressed("click")): #Verifica se o botão esquerdo do mouse é pressionado enquanto dentro da CollisionShape2d
  dragging = true #Muda a variável para "true" para confirmar que está sendo movido
  
 if (dragging && Input.is_action_pressed("click")): #verifica se o mouse está em movimento enquanto pressionado
  var position = get_viewport().get_mouse_position() #define a variável position para a posição do mouse
  
  set_position(position) #define o posicionamento do sprite para o posicionamento do mouse
 else:
  dragging = false #define que o mouse não está em movimento enquanto pressionado


func _on_Area2D_mouse_entered():
 mouse_in = true #Verifica se o mouse entrou na CollisionShape2D


func _on_Area2D_mouse_exited():
 mouse_in = false #Verifica se o mouse saiu da CollisionShape2D
