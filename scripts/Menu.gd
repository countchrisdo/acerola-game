extends Control
@onready var player = get_node("/root/world/player")

func _on_play_pressed():
	global.game_state = "running"
	global.score = 0
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	

func _on_quit_pressed():
	get_tree().quit()
