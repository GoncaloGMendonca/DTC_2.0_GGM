extends "res://mob.gd"


func _ready() -> void:
	animated_sprite_2d.play("fly")

#func _process(delta: float) -> void:
#
#	var wait_time := 3
#	await get_tree().create_timer(wait_time).timeout
#
#	linear_velocity = (Vector2.ZERO)
#
#	await get_tree().create_timer(wait_time).timeout
#
#

	
