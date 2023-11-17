extends "res://mob.gd"

var alpha_step: float = 0.005
var fade_direction: int = 1
var wait_time := 1.0
var alpha := 0.0
var fade_duration = 1.0  # Duration of each fade (in seconds)
var wait_duration = 1.0  # Duration of wait time between fades (in seconds)
var fade_timer = 0.0    # Timer to control fading


func _ready() -> void:
	animated_sprite_2d.play("fly")



func _process(delta):
	pass





#
#func spawn(spawn_pos:Vector2, spawn_rot: float) -> void:
#	super(spawn_pos,spawn_rot)

#	for i in range(15):
#		await get_tree().create_timer(wait_time).timeout
#		print("DIMINUI")
#		alpha += 0.1
#		self.modulate.a += alpha_step
#
#		await get_tree().create_timer(wait_time).timeout
#		print("RAPIDO")
#		alpha -= 0.1
#		self.modulate.a += alpha_step
#
#		animated_sprite_2d.play("fly")
