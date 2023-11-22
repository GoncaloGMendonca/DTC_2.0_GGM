extends "res://power_up_base.gd"


func powerup_activated() -> void:
	print("ACTIVE PONTOS")
	ScoreManager.powerDouble = true
	ScoreManager._timer_powerDouble()
	queue_free()


