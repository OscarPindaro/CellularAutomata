extends KinematicBody2D

# Declare member variables here. Examples:
var speed = 100
var currVelocity = Vector2(1,0) *speed
# var b = "text"
var rng = RandomNumberGenerator.new()
var arrowSprite : Sprite

signal collisionSignal

# Called when the node enters the scene tree for the first time.
func _ready():
	arrowSprite = get_node("arrow")
	connect("collisionSignal", get_parent(), "assignReward")


func _process(delta):
	if rng.randf_range(0, 1)<  0.05:
		var degrees = rng.randf_range(-PI/4, PI/4)
		currVelocity = currVelocity.normalized().rotated(degrees)*speed
	move_and_slide(currVelocity)
	allineSpriteToVector(currVelocity)
	if(get_slide_count() > 0):
		emit_signal("collisionSignal")
	

func allineSpriteToVector(vector : Vector2):
	arrowSprite.rotation_degrees =rad2deg(currVelocity.angle()+PI/2)
	
	
	

