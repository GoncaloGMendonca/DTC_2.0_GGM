extends Area2D

#func que deteca quando o player colide com o power up 
func _on_area_entered(_area: Area2D) -> void:
	powerup_activated()

func powerup_activated() -> void:
	pass
