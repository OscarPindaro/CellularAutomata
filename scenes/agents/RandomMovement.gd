extends KinematicBody2D

# Declare member variables here. Examples:
var speed = 100
var currVelocity = Vector2(1,0) *speed
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if rng.randf_range(0, 1)<  0.05:
		var degrees = rng.randf_range(0, PI/4)
		currVelocity = currVelocity.normalized().rotated(degrees)*speed
	currVelocity = move_and_slide(currVelocity)

