extends Node

var score: int = 0
var power_Double = false


func _timer_powerDouble() -> void:
	if ScoreManager.power_Double:
		var wait_time := 10.0
		await get_tree().create_timer(wait_time).timeout
		ScoreManager.power_Double = false


