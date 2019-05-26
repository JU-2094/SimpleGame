extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a
var monster
var psize = Vector2(1,1)
export var ptype ="normal"
# Called when the node enters the scene tree for the first time.
func _ready():
	var temp="bouncy"
	# $Platform.init_plat(temp)
	var ptype ="normal"
	monster = load('res://scenes/Monster.tscn').instance()
	add_child(monster)
	
	print(monster.name)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(plat.transform)
	pass