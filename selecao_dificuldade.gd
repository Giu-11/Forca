extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_surpresa_pressed():
	Dados.dificuldade = 's'
	get_tree().change_scene_to_file("res://jogo.tscn")


func _on_dificil_pressed():
	Dados.dificuldade = 'd'
	get_tree().change_scene_to_file("res://jogo.tscn")


func _on_medio_pressed():
	Dados.dificuldade = "m"
	get_tree().change_scene_to_file("res://jogo.tscn")


func _on_facil_pressed():
	Dados.dificuldade = "f"
	get_tree().change_scene_to_file("res://jogo.tscn")
