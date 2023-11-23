extends Node


@export var mob_scene: Array[PackedScene]
@export var powerup_scene: Array[PackedScene]


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




func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()


func new_game() -> void:
	ScoreManager.score = 0
	player.start(start_position.position)
	start_timer.start()
	hud.update_score(ScoreManager.score)
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
	ScoreManager.power_Double = false



func _on_start_timer_timeout() -> void:
	mob_timer.start()
	score_timer.start()
	power_up_timer.start()


func _on_score_timer_timeout() -> void:
	if ScoreManager.power_Double:
		ScoreManager.score *= 2
		hud.update_score(ScoreManager.score)
	else:
		ScoreManager.score += 1
		hud.update_score(ScoreManager.score)


func _on_mob_timer_timeout() -> void:
	var mob: Node2D = mob_scene.pick_random().instantiate()
	add_child(mob)
	
	mob_spawn_location.progress_ratio = randf()
	var direction := mob_spawn_location.rotation + 90
	direction += randf_range(-PI / 4, PI / 4)
	
	mob.spawn(mob_spawn_location.position, direction)
	

func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		pause_menu.show()
		get_tree().paused = true
		


func _on_pause_menu_bmusic() -> void:
	if background_music.stream_paused:
		background_music.stop()
	else:
		background_music.play()

func _on_pause_menu_bresume() -> void:
	pause_menu.hide()
	resume_count_down_music.play()
	var wait_time := 3.0
	await get_tree().create_timer(wait_time).timeout
	get_tree().paused = false


func _on_power_up_timer_timeout() -> void:
	var powerup: Node2D = powerup_scene.pick_random().instantiate()
	# Sistema de spawn dos power ups, abaixo do tamanho do ecrã para não nascer escondido
	powerup.position = Vector2(randf_range(50, 430), randf_range(20, 700))
	# Adiciona os power ups
	add_child(powerup)
