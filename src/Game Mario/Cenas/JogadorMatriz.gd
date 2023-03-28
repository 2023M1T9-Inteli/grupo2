extends Control

onready var text_input = $LineEdit
onready var text_output = $Label3

func _ready():
	# Create the text input field
	text_input = LineEdit.new()

	add_child(text_input)

	# Create the text output label
	text_output = Label.new()
	text_output.rect_position = Vector2(50, 100) # Set the position of the label
	add_child(text_output)

	# Connect the "text_entered" signal of the text input to the "_on_text_entered" method
	text_input.connect("text_entered", self, "_on_text_entered")

func _on_text_entered(text: String):
	# Get the current text of the label and add the new entered text to it
	var current_text = text_output.text
	current_text += "\n" + text
	text_output.text = current_text
