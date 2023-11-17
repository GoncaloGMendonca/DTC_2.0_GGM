extends "res://mob.gd"


func _ready() -> void:
	animated_sprite_2d.play("fly")


func spawn(spawn_pos:Vector2, spawn_rot: float) -> void:
	super(spawn_pos,spawn_rot)
	linear_velocity = linear_velocity * 2
	
	
	var wait_time := 1.0

	for i in range(15):
		await get_tree().create_timer(wait_time).timeout
		print("LENTO")
		freeze = true
		linear_velocity = linear_velocity / 15
		animated_sprite_2d.stop()

		await get_tree().create_timer(wait_time).timeout
		print("RAPIDO")
		freeze = false
		linear_velocity = linear_velocity * 15
		animated_sprite_2d.play("fly")
