extends KinematicBody2D

const SPEED = 100
const OMEGA = 5 #rad/s
var currVelocity = Vector2(1,0) *SPEED
var currOmega = 0;
var rng = RandomNumberGenerator.new()
var arrowSprite : Sprite

var points : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	arrowSprite = $arrow


func _process(delta):
	var spaceState = get_world_2d().direct_space_state
	var velDirVector = currVelocity.normalized()*32*4
	var direction = Vector2(velDirVector.x, velDirVector.y);
	var result = spaceState.intersect_ray(position, position+direction, [self], collision_mask)
	if result:
		if (typeof(result.collider) == TYPE_OBJECT):
			print(result.collider.get_class())
			print(result.collider.name)
	
	var realization = rng.randf_range(0, 1);
	if realization <  0.1:
		currOmega = -OMEGA
	elif realization >  0.7:
		currOmega = OMEGA
	else:
		currOmega = 0
		
	
	currVelocity = currVelocity.normalized().rotated(currOmega*delta)*SPEED
	move_and_slide(currVelocity)
	allineSpriteToVector(currVelocity)
	if(get_slide_count() > 0):
		assignReward()
	

func allineSpriteToVector(vector : Vector2):
	arrowSprite.rotation_degrees =rad2deg(currVelocity.angle()+PI/2)
	
func assignReward():
	points -= 10	
	
