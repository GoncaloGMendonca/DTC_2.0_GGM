extends "res://power_up_base.gd"


func powerup_activated() -> void:
	print("APAGA")
	get_tree().call_group("mob","queue_free")
	queue_free()
