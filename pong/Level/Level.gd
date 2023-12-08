extends Node


var PlayerScore = 0
var OpponentScore = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Left_body_entered(body):
	OpponentScore += 1
	score_archived()


func _on_Right_body_entered(body):
	PlayerScore += 1
	score_archived()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)


func _on_CountdownTimer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false
	
	
func score_archived():
	$Ball.position = Vector2(640, 360)
	OpponentScore += 1
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	#$ScoreSound.play()
