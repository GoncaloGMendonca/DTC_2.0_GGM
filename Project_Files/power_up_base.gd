extends Area2D

var score = 0

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("BASE") # Replace with function body.
##	if body is Area2d: 
#	get_tree().call_group("mob","queue_free")
#	queue_free()
	powerup_activated()


#	score *= 2

func powerup_activated() -> void:
	pass
