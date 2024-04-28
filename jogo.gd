extends Node2D

var file = "res://outros_assets/br-sem-acentos.txt"
var rng = RandomNumberGenerator.new()
var palavra = []
var palavrarevelada = []
var letras_usadas = []
var hp = 6
var perdeu = false
var acabou = false
var palavra_str = ""
var alfabeto = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']


func _ready():
	var f = FileAccess.open(file, FileAccess.READ)
	var tamanho = f.get_length()
	hp = 6
	print(tamanho)
	var num = rng.randf_range(0, tamanho)
	print(num)
	f.seek(num)
	f.get_line()
	palavra_str = (f.get_line()).to_upper()
	for i in range(len(palavra_str)):
		palavra.append(palavra_str[i])
		if palavra_str[i] == '-':
			palavrarevelada.append('-')
		else:
			palavrarevelada.append('_')
	print(palavra)
	atualiza_forca()
	atualiza_palavra()
	atualiza_letras()
	get_node("vcGanhou").hide()
	f.close()


func _input(event):
	#recebe os inputs e faz as coisas
	if (event is InputEventKey) and (event.pressed) and not acabou:
		var letra = event.as_text()
		atualiza_palavra()
		
		if (letra not in letras_usadas) and (letra in alfabeto):
			letras_usadas.append(letra)
			atualiza_letras()
			
			if letra in palavra:
				print('tá lá')
				#faz a letra aparecer
				for i in range(len(palavra)):
					
					if letra == palavra[i]:
						palavrarevelada[i] = letra
						atualiza_palavra()
						
						if palavrarevelada == palavra:
							print("ganhou")
							acabou = true
							fim()
				
			else:
				print('n tá lá')
				print(palavra)
				print(letra)
				hp -= 1
				atualiza_forca()
		else:
			print("vc já usou essa letra")


func fim():
	get_node("vcGanhou").show()
	if perdeu:
		get_node("vcGanhou/Como acabou").text = "ERROU"
	else:
		get_node("vcGanhou/Como acabou").text = "ACERTOU"
	get_node("vcGanhou/palavra").text = palavra_str
	pass


func atualiza_forca():
	if(hp==6):
		get_node("forca").animation = "6hp"
	elif(hp==5):
		get_node("forca").animation = "5hp"
	elif(hp==4):
		get_node("forca").animation = "4hp"
	elif(hp==3):
		get_node("forca").animation = "3hp"
	elif(hp==2):
		get_node("forca").animation = "2hp"
	elif(hp==1):
		get_node("forca").animation = "1hp"
	else:
		get_node("forca").animation = "0hp"
		print("perdeu")
		acabou = true
		perdeu = true
		fim()


func atualiza_letras():
	var letras = ""

	for l in letras_usadas:
		letras += " " + l + " "
		
	$letrasusadas.text = letras


func atualiza_palavra():
	var palavra_tela = ""

	for i in palavrarevelada:
		palavra_tela += i + " "
		
	$Palavra.text = palavra_tela


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
