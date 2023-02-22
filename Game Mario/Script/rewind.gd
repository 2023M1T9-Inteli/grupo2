extends Node

var is_rewinding = false
var rewind_length = (60 * 3)
var count = 0;
var DATA = []
var rewind_objects

var rewind_ghost = load("res://Cenas/rewind_ghost.tscn")

func _ready():
	rewind_objects = get_tree().get_nodes_in_group("rewind")
	for mem in rewind_objects:
		DATA.push_back([mem.name])

func handle_rewind_objects():
	if(Input.is_action_pressed("ui_space")):
		is_rewinding = true
		for mem in rewind_objects:
			var data = DATA[count]
			if(data.size() > 1):
				var current_frame = data[0]
				var ani = mem.get_node("Sprite")
				
				#Set our objects animation/position/direciton
				ani.animation = current_frame[0]
				mem.global_position = current_frame[1]
				ani.flip_h = current_frame[1]
				
				#Do the ghost functionality
				var ghost : Sprite = rewind_ghost.instance()
				ghost.texture = ani.frames.get_frame(ani.animation,ani.frame)
				ghost.global_position = mem.global_position
				ghost.flip_h = ani.flip_h
				get_parent().add_child(ghost)
				
				#remove thet first frame as we've just used it
				data.pop_front()
				count += 1
		count = 0
	else:# Record all objects in our rewind group
		is_rewinding = false
		for mem in rewind_objects:
			var data = DATA[count]
			var ani = mem.get_node("Sprite")
			data.push_front([ani.animation,mem.global_position,ani.flip_h])
			count += 1
			if(data.size() > rewind_length): #our record is longer than 3 secs, remove last frame
				data.pop_back()
		count = 0
		pass
func _physics_process(delta):
	handle_rewind_objects()






