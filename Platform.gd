extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tnormal =preload("res://assets/PNG/shiny/6.png")
var tbouncy =preload("res://assets/PNG/shiny/11.png")
var tsticky =preload("res://assets/PNG/shiny/8.png")
var tdead = preload("res://assets/PNG/shiny/10.png")
var tice = preload("res://assets/PNG/shiny/9.png")
export var ptype ="normal"
var deadly =false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func init_plat(type):
	ptype=type
	if ptype == "normal":
		self.physics_material_override.friction=1
		self.physics_material_override.bounce=10
		self.physics_material_override.absorbent=false
		$CollisionShape2D/Sprite.texture=tnormal
	if ptype == "bouncy":
		self.physics_material_override.friction=1
		self.physics_material_override.bounce=70
		self.physics_material_override.absorbent=false
		$CollisionShape2D/Sprite.texture=tbouncy
	if ptype == "sticky":
		self.physics_material_override.friction=4
		self.physics_material_override.bounce=0
		self.physics_material_override.absorbent=true
		$CollisionShape2D/Sprite.texture=tsticky
	if ptype == "ice":
		self.physics_material_override.friction=-10
		self.physics_material_override.bounce=0
		self.physics_material_override.absorbent=false
		$CollisionShape2D/Sprite.texture=tice
	if ptype == "dead":
		self.physics_material_override.friction=1
		self.physics_material_override.bounce=0
		self.physics_material_override.absorbent=false
		deadly=true
		$CollisionShape2D/Sprite.texture=tdead
