extends Sprite

var near_player : bool = false
export var destination : String

func _process(delta):
	if near_player && Input.is_action_just_released("ui_accept"):
		get_tree().change_scene(destination)
		
	pass


func _on_Area2D_body_entered(body):
	if not body.name == "Player":
		return 
	near_player = true

func _on_Area2D_body_exited(body):
	if not body.name == "Player":
		return 
	near_player = false
	pass # Replace with function body.
