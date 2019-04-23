tool
extends Label

func _ready():
	text = ""

func _on_resized():
	rect_position.x = -rect_size.x/2
	pass # Replace with function body.
