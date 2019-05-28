extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a
var monster
var prev_pos
var curr_pos
var platforml
var platformr
var randl = RandomNumberGenerator.new()
var randr = RandomNumberGenerator.new()
var psize = Vector2(1,1)
var PLATFORM = preload('res://scenes/Platform.tscn')
var width = ProjectSettings.get_setting("display/window/size/width")
# Called when the node enters the scene tree for the first time.
func _ready():
	var temp="bouncy"
	$Platform.init_plat(2)
	monster = load('res://scenes/Monster.tscn').instance()
	add_child(monster)
	prev_pos=monster.position.y
	curr_pos=monster.position.y
	#print("here",prev_pos)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ppos()
	
	pass
func ppos():
	curr_pos=monster.position.y
	print(curr_pos,":",prev_pos)
	if curr_pos-prev_pos <=-200:
		prev_pos=curr_pos
		#print("papu",prev_pos)
		pgen()
	pass
func pgen():
	randl.randomize()
	randr.randomize()
	var pltype=randl.randi_range(1,5)
	var prtype=randr.randi_range(1,5)
	platforml = PLATFORM.instance()
	platforml.init_plat(pltype)
	platformr = PLATFORM.instance()
	platformr.init_plat(prtype)
	platforml.global_position = Vector2(0,curr_pos)
	platformr.global_position = Vector2(500,curr_pos)
	add_child(platforml)
	add_child(platformr)
	pass
