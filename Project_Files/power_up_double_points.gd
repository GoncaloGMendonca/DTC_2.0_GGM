extends "res://power_up_base.gd"


signal doublepointsactive


func powerup_activated() -> void:
	print("ACTIVE PONTOS")
	doublepointsactive.emit()
	ScoreManager.score = 100 

	queue_free()
