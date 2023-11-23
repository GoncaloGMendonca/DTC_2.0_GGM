extends "res://Power_Ups/power_up_base.gd"


func powerup_activated() -> void:
	#Mete a true a var power_Double, que esta no score manager
	ScoreManager.power_Double = true
	#Ativa a func timer_power_Double que temporiza o power up em 10sec 
	ScoreManager._timer_power_Double()
	queue_free()


