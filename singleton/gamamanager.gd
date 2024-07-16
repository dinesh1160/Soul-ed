extends Node

var being_auro: bool = true
var sk_cam: Camera2D

var GROUP_NAME: String = "skeleton"

var base_scene : PackedScene = preload("res://Base/base.tscn")
var main_scene : PackedScene = preload("res://main/main.tscn")
var gameover_scene: PackedScene = preload("res://gameover/gameover.tscn")

	
func load_base():
	get_tree().change_scene_to_packed(base_scene)

func game_over():
	get_tree().change_scene_to_packed(gameover_scene)
	
func load_main():
	get_tree().change_scene_to_packed(main_scene)
	
func reload():
	if Input.is_action_just_pressed("restart"):
		load_main()
