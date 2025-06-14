extends Label


func _on_game_game_end(score: Variant) -> void:
	print(score)
	print(str(score.x))
	text = str(score.x)
