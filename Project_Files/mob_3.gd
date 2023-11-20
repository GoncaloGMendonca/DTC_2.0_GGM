extends "res://mob.gd"

var alpha_step: float = 0.005
var fade_direction: int = 1  # 1 for fading in, -1 for fading out


func _ready() -> void:
	animated_sprite_2d.play("fly")

func _process(delta: float) -> void:
# Update alpha value
	self.modulate.a += alpha_step * fade_direction

	# Check if the alpha value is out of bounds
	if self.modulate.a <= 0.0 or self.modulate.a >= 1.0:
		# Invert direction when close to bounds
		fade_direction *= -1
		# Clamp alpha value to avoid issues with floating-point precision
		self.modulate.a = clamp(self.modulate.a, 0.0, 1.0)
