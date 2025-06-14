extends StaticBody2D

var speed = 500
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position = position.clamp(Vector2(0,75), Vector2(screen_size.x,screen_size.y-75))
