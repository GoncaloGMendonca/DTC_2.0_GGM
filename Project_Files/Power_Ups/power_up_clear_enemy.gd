extends "res://Power_Ups/power_up_base.gd"


func powerup_activated() -> void:
	get_tree().call_group("mob","queue_free")
	queue_free()
