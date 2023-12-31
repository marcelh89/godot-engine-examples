extends KinematicBody2D

var speed = 400
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		#$CollisionSound.play()

func stop_ball():
	speed = 0
	
func restart_ball():
	speed = 600
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
	
