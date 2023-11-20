extends CanvasLayer

signal bmusic
signal brestart
signal bresume


@onready var main = $"../"
@onready var control_music_button: Button = %ControlMusic_Button




func _on_button_pressed() -> void:
	main.pauseMenu() 
	


func _on_quit_button_pressed() -> void:
	get_tree().quit()




func _on_control_music_button_pressed() -> void:
	bmusic.emit()
#	control_music_button.set_button_icon("res://assets/art/Icons/Speaker_Icon.png")


func _on_restart_button_pressed() -> void:
	brestart.emit()
	



func _on_resume_button_pressed() -> void:
	bresume.emit()
