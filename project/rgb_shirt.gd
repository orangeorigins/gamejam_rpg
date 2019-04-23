extends Sprite

var last_color = "red"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if last_color == "red":
		if modulate.b > 0:
			modulate.b -= .01
		modulate.g += .01
		if modulate.g >= 1:
			last_color = "green"
	elif last_color == "green":
		if modulate.r > 0:
			modulate.r -= .01
		modulate.b += .01
		if modulate.b >= 1:
			last_color = "blue"
	elif last_color == "blue":
		if modulate.g > 0:
			modulate.g -= .01
		modulate.r += .01
		if modulate.r >= 1:
			last_color = "red"
	pass
