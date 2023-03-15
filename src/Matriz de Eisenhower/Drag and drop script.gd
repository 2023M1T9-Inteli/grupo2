extends Sprite

var mouse_in = false
var dragging = false
var collide = false
var speed = rand_range(1,10)
var objetoEmMovimento = null

func _process(delta):
 if (mouse_in && Input.is_action_pressed("click")):
  dragging = true
  
 if (dragging && Input.is_action_pressed("click")) and objetoEmMovimento == null:
  objetoEmMovimento = 1
  var position = get_viewport().get_mouse_position()
  set_position(position)

 else:
  dragging = false
  objetoEmMovimento = null
 if collide == true:
		move_local_x(speed)
		

func _on_Area2D_mouse_entered():
 mouse_in = true


func _on_Area2D_mouse_exited():
 mouse_in = false


func _on_Area2D_area_entered(area):
	collide = true


func _on_Area2D_area_exited(area):
	collide = false
