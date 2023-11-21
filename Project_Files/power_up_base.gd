extends Area2D




func _on_area_entered(_area: Area2D) -> void:
	print("BASE") # Replace with function body.
###	if body is Area2d: 
##	get_tree().call_group("mob","queue_free")
##	queue_free()
	powerup_activated()



func powerup_activated() -> void:
	pass
