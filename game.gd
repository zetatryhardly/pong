extends Node2D

@export var game_active = false
signal game_start
signal game_end(score)
@onready var ball = get_node("/root/Game/Ball")
var score = Vector2i(0,0) 

func _init() -> void:
	score = Vector2i(0,0) 

func _process(_delta: float) -> void:
	if !game_active && Input.is_action_pressed("start_game"):
		game_active = true
		game_start.emit()
		
	#elif ball.position.x < 1:
		#print(ball.position)
		##game over
		#game_active = false
		#game_end.emit()
	#elif ball.position.x > 299:
		##game won
		#print(ball.position)
		#game_active = false
		#game_end.emit()

func _on_lose_area_body_entered(_body: Node2D) -> void:
	if game_active:
		print("Boo")
		score.y += 1
		game_active = false
		game_end.emit(score)
		
		
	


func _on_win_area_body_entered(_body: Node2D) -> void:
	if game_active:
		print("Yay")
		score.x += 1
		game_active = false
		game_end.emit(score)
		
