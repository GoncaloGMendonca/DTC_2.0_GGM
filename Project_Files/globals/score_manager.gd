extends Node

var score: int = 0
var powerDouble = false



func _timer_powerDouble() -> void:
	if ScoreManager.powerDouble:
		var wait_time := 10.0
		await get_tree().create_timer(wait_time).timeout
		ScoreManager.powerDouble = false


