extends "res://Power_Ups/power_up_base.gd"


func powerup_activated() -> void:
	ScoreManager.power_Double = true
	ScoreManager._timer_power_Double()
	queue_free()


