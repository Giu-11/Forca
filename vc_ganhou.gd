extends Node2D


func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://jogo.tscn")


func _on_inicio_pressed():
		get_tree().change_scene_to_file("res://main.tscn")
