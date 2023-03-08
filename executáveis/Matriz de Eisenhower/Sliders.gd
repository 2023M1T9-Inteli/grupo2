extends Slider





func _ready():
	for node in get_tree().get_nodes_in_group("sliders"):
		node.max_value = max(node.max_value, self.max_value)



func _on_HSlider_value_changed(value):
	for node in get_tree().get_nodes_in_group("sliders"):
		node.max_value = max(node.max_value, self.max_value)


func _on_HSlider2_value_changed(value):
	for node in get_tree().get_nodes_in_group("sliders"):
		node.max_value = max(node.max_value, self.max_value)


func _on_HSlider3_value_changed(value):
	for node in get_tree().get_nodes_in_group("sliders"):
		node.max_value = max(node.max_value, self.max_value)

func _on_HSlider4_value_changed(value):
	for node in get_tree().get_nodes_in_group("sliders"):
		node.max_value = max(node.max_value, self.max_value)
