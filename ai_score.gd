extends Label


func _on_game_game_end(score: Variant) -> void:
	text = str(score.y)
