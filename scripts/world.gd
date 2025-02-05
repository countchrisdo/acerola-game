extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.game_first_loadin == true:
		$player.position.x = global.player_start_posx
		$player.position.y = global.player_start_posy
	else:
		$player.position.x = global.player_exit_world2_posx
		$player.position.y = global.player_exit_world2_posy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()

func _on_world2_transition_point_body_entered(body):
	if body.has_method("player"):
		print("door entered, setting transition_scene to: true")
		global.transition_scene = true

# #tihs function was causing issues, setting transition scene to false too early
# func _on_world2_transition_point_body_exited(body):
# 	if body.has_method("player"):
# 		#print("door exited, setting transition_scene to: false")
# 		#global.transition_scene = false
# 		pass
		
func change_scene():
	if global.transition_scene == true:
		print("transition_scene set to: true (confirmed) ")
		if global.current_scene == "world":
			print("current_scene is: ", global.current_scene)
			get_tree().change_scene_to_file("res://scenes/world2.tscn")
			global.game_first_loadin = false
			#calling this function in global so world2 can communicate with world
			global.finish_changescenes()
