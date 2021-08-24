extends KinematicBody2D

var speed = 100
var currVelocity = Vector2(1,0) *speed
var rng = RandomNumberGenerator.new()
var arrowSprite : Sprite

var points : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	arrowSprite = $arrow


func _process(delta):
	if rng.randf_range(0, 1)<  0.05:
		var degrees = rng.randf_range(-PI/4, PI/4)
		currVelocity = currVelocity.normalized().rotated(degrees)*speed
	move_and_slide(currVelocity)
	allineSpriteToVector(currVelocity)
	if(get_slide_count() > 0):
		assignReward()
	

func allineSpriteToVector(vector : Vector2):
	arrowSprite.rotation_degrees =rad2deg(currVelocity.angle()+PI/2)
	
func assignReward():
	points -= 10	
	
