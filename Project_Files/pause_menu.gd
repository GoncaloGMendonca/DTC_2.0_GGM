extends Control

signal bmusic
signal brestart
signal bresume

@onready var main = $"../"
@onready var button: Button = $Button



func _on_button_pressed() -> void:
	main.pauseMenu() 


func _on_quit_button_pressed() -> void:
	get_tree().quit()




func _on_control_music_button_pressed() -> void:
	bmusic.emit() 


func _on_restart_button_pressed() -> void:
	brestart.emit()



func _on_resume_button_pressed() -> void:
	bresume.emit()
