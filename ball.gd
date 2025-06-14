extends RigidBody2D

var screen_size
var velocity = Vector2(0, 0)
#var game_active = false
@onready var paddle = get_node("/root/Game/Paddle")
@onready var game = get_node("/root/Game")


func _ready():
	gravity_scale = 0
	game_setup()

func game_setup():
	sleeping = true
	velocity = Vector2(0, 0)
	position = paddle.position + Vector2(40,0)	
	

func _physics_process(delta: float) -> void:
	if game.game_active:
		var collision_info = move_and_collide(velocity * delta)
		if collision_info:
			velocity = velocity.bounce(collision_info.get_normal())

func _process(_delta: float) -> void:
	if !game.game_active:
		position.x = paddle.position.x + 40
		position.y = paddle.position.y


func _on_game_game_start() -> void:
	velocity = Vector2(300,300)
	sleeping = false
	


func _on_game_game_end(_score) -> void:
	game_setup()
