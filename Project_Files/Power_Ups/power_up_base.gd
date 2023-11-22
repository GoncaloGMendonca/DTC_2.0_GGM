extends Area2D


func _on_area_entered(_area: Area2D) -> void:
	print("BASE")
	powerup_activated()

func powerup_activated() -> void:
	pass
