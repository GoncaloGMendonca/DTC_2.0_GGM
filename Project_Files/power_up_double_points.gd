extends "res://power_up_base.gd"

signal doublepointsactive

func powerup_activated() -> void:
	print("ACTIVE PONTOS")
	doublepointsactive.emit()
	queue_free()
