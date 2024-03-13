extends Node

signal game_over

@onready var player = get_node("/root/world/player")
var player_current_attack = false

var current_scene = "world" #world or world2
var transition_scene = false 

var player_exit_world2_posx = 395
var player_exit_world2_posy = 120
var player_start_posx = 20
var player_start_posy = 120

var game_first_loadin = true
var game_state

func _ready():
	game_state = "idle"
	player.player_died.connect(_on_player_died)

func _on_player_died():
	print("global has recieved death signal")
	print("now emiting: game_over")
	emit_signal("game_over")
	end_game()
	
func game_started():
	game_state = "running"
	#run code or call functions important to the games initial operation

func end_game():
	game_state = "over"
	get_tree().change_scene_to_file("res://scenes/menu_end.tscn")
	current_scene = "end_screen"
	#go to end game screen
	#save anything worth saving

func finish_changescenes():
	print("finish_changescenes called")
	if transition_scene == true:
		transition_scene = false
		print("transition_scene set to: false")
		if current_scene == "world":
			print("Current scene is world, going to world2")
			current_scene = "world2"
		else:
			print("Current scene is not world, going to world")
			current_scene = "world"
		print("New current_scene var is: ", current_scene)
	else:
		print("error: transition_scene is false for some reason, function not run")
