extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a
var monster
var prev_pos
var curr_pos
var curr_level
var lev_pos = 0
var platforml
var platformr
var platforml1
var platformr1
var platforml2
var platformr2
var randl = RandomNumberGenerator.new()
var randr = RandomNumberGenerator.new()
var psize = Vector2(1,1)
var PLATFORM = preload('res://scenes/Platform.tscn')
var width = ProjectSettings.get_setting("display/window/size/width")
# Called when the node enters the scene tree for the first time.
func _ready():
	curr_level=1
	var temp="bouncy"
	$Platform.init_plat(2)
	monster = load('res://scenes/Monster.tscn').instance()
	add_child(monster)
	prev_pos=monster.position.y
	curr_pos=monster.position.y
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
	platformr1 = PLATFORM.instance()
	platforml1 = PLATFORM.instance()
	var pltype1=randl.randi_range(1,5)
	var prtype1=randr.randi_range(1,5)
	platforml1.init_plat(pltype1)
	platformr1.init_plat(prtype1)
	platforml1.global_position = Vector2(0,curr_pos-200)
	platformr1.global_position = Vector2(500,curr_pos-200)
	add_child(platforml1)
	add_child(platformr1)
	platformr2 = PLATFORM.instance()
	platforml2 = PLATFORM.instance()
	var pltype2=randl.randi_range(1,5)
	var prtype2=randr.randi_range(1,5)
	platforml2.init_plat(pltype2)
	platformr2.init_plat(prtype2)
	platforml2.global_position = Vector2(0,curr_pos-400)
	platformr2.global_position = Vector2(500,curr_pos-400)
	add_child(platforml2)
	add_child(platformr2)
	print("here")
	#print("here",prev_pos)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ppos()
	
	pass
func ppos():
	curr_pos=monster.position.y
	#print(curr_pos,":",prev_pos)
	if curr_pos-prev_pos <=-200:
		prev_pos=curr_pos
		lev_pos =lev_pos + 1
		if lev_pos==10:
			lev_pos=0
			curr_level=curr_level+1
		pgen(curr_level)
	
	pass
func pgen(level):
	randl.randomize()
	randr.randomize()
	var pltype
	var prtype
	pltype=randl.randi_range(1,5)
	prtype=randr.randi_range(1,5)
	for i in range(0, level):
		if pltype != 5:
			pltype=randr.randi_range(1,5)
	for i in range(0, level):
		if prtype != 5:
			prtype=randr.randi_range(1,5)
	platforml = PLATFORM.instance()
	platforml.init_plat(pltype)
	platformr = PLATFORM.instance()
	platformr.init_plat(prtype)
	platforml.global_position = Vector2(0,curr_pos-400)
	platformr.global_position = Vector2(500,curr_pos-400)
	add_child(platforml)
	add_child(platformr)
	pass
