extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var n = Vector2()
var x = Vector2()

func _ready():
	pass

#func _draw():
#	var n = Vector2()
#	var x = Vector2()
##	draw_rect(1.0,Vector2(50,50),Color(255,255,255))
#	update()

func _on_Button_pressed():
	VBoxContainer
#	draw_line(n,x,Color(255,255,255))
	n = get_global_mouse_position()
#	var n = $VBoxContainer/Button.rect_global_position
	print(n)

func _on_Button8_pressed():
#	draw_line(n,x,Color(255,255,255))
	update()
	x = get_global_mouse_position()
	print(x)


func _on_Button9_pressed():
	var line = Line2D.new()
	line.color = Color(1,0,0)
	line.width = 2
	line.add_point(n)
	line.add_point(x)
	line.add_segment(0,1)
	add_child(line)
