extends Node2D

func _on_button_pressed():
	get_tree().change_scene_to_file("res://jogo.tscn")


func _on_sair_pressed():
	get_tree().quit()