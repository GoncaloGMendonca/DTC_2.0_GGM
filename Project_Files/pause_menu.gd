extends Control

@onready var main = $"../"
@onready var button: Button = $Button



func _on_button_pressed() -> void:
	main.pauseMenu() 
