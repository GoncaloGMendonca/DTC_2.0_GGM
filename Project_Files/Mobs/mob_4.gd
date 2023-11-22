extends "res://Mobs/mob.gd"


func _ready() -> void:
	animated_sprite_2d.play("fly")

func spawn(spawn_pos:Vector2, spawn_rot: float) -> void:
	super(spawn_pos,spawn_rot)
	linear_velocity = linear_velocity * 2
	
	var wait_time := 1.0

	for i in range(15):
		await get_tree().create_timer(wait_time).timeout
		freeze = true
		linear_velocity = linear_velocity / 15
		animated_sprite_2d.stop()

		await get_tree().create_timer(wait_time).timeout
		freeze = false
		linear_velocity = linear_velocity * 15
		animated_sprite_2d.play("fly")

func resume_movement():
	animated_sprite_2d.play("fly")

func _on_timer_timeout() -> void:
	animated_sprite_2d.stop()
