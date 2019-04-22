extends Node2D

onready var area = $Area2D
onready var col = $Area2D/CollisionShape2D

# Declare member variables here. Examples:
export var npc_name : String = ''
export var dialog = ["HEY MAN", "ARE YOU READY FOR UNIVERSITY OF RPG??!?"]
var dialog_index = 0

var near_player : bool = false

export var is_sitting : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	area.connect("body_entered", self, "_on_Area2D_body_entered")
	$RichTextLabel2.text = ""
	$RichTextLabel.text = ""
	
	if is_sitting:
		$"NPC SITTING".visible = true
		$NPC_Template.visible = false
	else:
		$NPC_Template.visible = true
		$"NPC SITTING".visible = false
		
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && near_player:
		
		#say nothing when finished with lines
		if dialog_index == -1:
			$RichTextLabel.text = ""
		else:
			$RichTextLabel2.text = npc_name
			$RichTextLabel.text= dialog[dialog_index]
		dialog_index += 1
		if dialog_index >= dialog.size():
			dialog_index = -1
			
		
	pass


func _on_Area2D_body_entered(body):
	if not body.name == "Player":
		return 
	near_player = true

func _on_Area2D_body_exited(body):
	if not body.name == "Player":
		return 
	near_player = false
	dialog_index = 0
	$RichTextLabel2.text = ""
	$RichTextLabel.text = ""
	
	pass # Replace with function body.
