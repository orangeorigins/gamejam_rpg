extends Node2D

onready var area = $Area2D
onready var col = $Area2D/CollisionShape2D

# Declare member variables here. Examples:
export var npc_name = ''
export var dialog = []



# Called when the node enters the scene tree for the first time.
func _ready():
	area.connect("body_entered", self, "_on_Area2D_body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if not body.name == "Player":
		return 
	