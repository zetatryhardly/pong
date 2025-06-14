extends StaticBody2D

var speed = 500
var screen_size
@onready var ball = get_node("/root/Game/Ball")
@onready var game = get_node("/root/Game")

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if !game.game_active:
		return
		
	var v = Vector2.ZERO 
	var pos = ball.position 
	v.y = pos.y - self.position.y

	if v.length() > 0:
		v = v.normalized() * speed
#
	position += v * delta
	position = position.clamp(Vector2(0,75), Vector2(screen_size.x,screen_size.y-75))


func _on_game_game_start() -> void:
	pass # Replace with function body.
