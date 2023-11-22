extends "res://Power_Ups/power_up_base.gd"


func powerup_activated() -> void:
	ScoreManager.powerDouble = true
	ScoreManager._timer_powerDouble()
	queue_free()


