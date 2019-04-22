extends Node2D

onready var area = $Area2D
onready var col = $Area2D/CollisionShape2D

# Declare member variables here. Examples:
onready var npc_name : String = $Name.text
export var dialog = []
var dialog_index = 0

var near_player : bool = false

onready var d_label = $Dialog

export var is_sitting : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	area.connect("body_entered", self, "_on_Area2D_body_entered")
	$Name.text = ""
	$Dialog.text = ""
	
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
			$Name.visible = false
			d_label.visible = false
		else:
			$Name.visible = true
			d_label.visible = true
			$Name.text = npc_name
			d_label.text = dialog[dialog_index]
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
	$Name.visible = false
	$Dialog.visible = false
	
	pass # Replace with function body.
