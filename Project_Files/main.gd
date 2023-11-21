extends Node


@export var mob_scene: Array[PackedScene]
@export var powerup_scene: Array[PackedScene]


var score: int 
var paused = false


@onready var mob_timer: Timer = %MobTimer
@onready var score_timer: Timer = %ScoreTimer
@onready var start_timer: Timer = %StartTimer
@onready var start_position: Marker2D = %StartPosition
@onready var player: Area2D = %Player
@onready var mob_spawn_location: PathFollow2D = %MobSpawnLocation
@onready var hud: CanvasLayer = %HUD
@onready var game_over_music: AudioStreamPlayer = %GameOverMusic
@onready var background_music: AudioStreamPlayer = %BackgroundMusic
@onready var pause_menu: CanvasLayer = %PauseMenu
@onready var resume_count_down_music: AudioStreamPlayer = %Resume_CountDownMusic
@onready var power_up_timer: Timer = %PowerUp_Timer


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	new_game() 



func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()


func new_game() -> void:
	score = 0
	player.start(start_position.position)
	start_timer.start()
	hud.update_score(score)
	hud.show_message("Get Ready")
	get_tree().call_group("mob","queue_free")
	get_tree().call_group("powerup","queue_free")
	background_music.play()
	pause_menu.hide()
	get_tree().paused = false 
	

func game_over() -> void:
	mob_timer.stop()
	score_timer.stop()
	hud.show_game_over()
	background_music.stop()
	game_over_music.play()
	pause_menu.hide()
	power_up_timer.stop()



func _on_start_timer_timeout() -> void:
	mob_timer.start()
	score_timer.start()
	power_up_timer.start()


func _on_score_timer_timeout() -> void:
	score += 1
	hud.update_score(score)
	


func _on_mob_timer_timeout() -> void:
	var mob: Node2D = mob_scene.pick_random().instantiate()
	add_child(mob)
	
	mob_spawn_location.progress_ratio = randf()
	var direction := mob_spawn_location.rotation + 90
	direction += randf_range(-PI / 4, PI / 4)
	
	mob.spawn(mob_spawn_location.position, direction)
	
#	mob.position = mob_spawn_location.position
#	mob.rotation = direction
#
#	var velocity = Vector2(randf_range(150.0,250.0),0)
#	mob.linear_velocity = velocity.rotated(direction)
	


func pauseMenu():
	if paused:
		print("TIME 1")
		pause_menu.hide()
		get_tree().paused = false
	else:
		print("TIME 0")
		pause_menu.show()
		get_tree().paused = true
		


func _on_pause_menu_bmusic() -> void:
	if background_music.stream_paused:
		background_music.stop()
		print("STOP MUSICA")
	else:
		background_music.play()
		print("PLAY MUSICA")

func _on_pause_menu_bresume() -> void:
	pause_menu.hide()
	print("RESUME")
	
	resume_count_down_music.play()
	var wait_time := 3.0
	await get_tree().create_timer(wait_time).timeout
	print("PASSOU")
	get_tree().paused = false


func _on_power_up_timer_timeout() -> void:
	print("NASCEU")
	var powerup: Node2D = powerup_scene.pick_random().instantiate()
	# Set the power-up's position within the game area REVER 
	powerup.position = Vector2(randf_range(0, 480), randf_range(0, 720))
	# Add the power-up to the scene
	add_child(powerup)




#	print("PONTOS DOBRO")
#	score_timer.stop()
#	score += 20000
#	hud.update_score(score)
	
