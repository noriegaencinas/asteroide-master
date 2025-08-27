extends Node

var score = 0  # Puntos iniciales

@onready var score_label = get_node("ScoreLabel")  
@onready var game_over_label = get_node("GameOverLabel") 

@onready var enemy_scene = preload("res://Enemy.tscn")  # Carga la escena de los enemigos

func _ready():
	if score_label:  # Verificamos que el nodo Label se haya encontrado
		score_label.text = "Puntos: " + str(score)  # Mostrar puntos iniciales
	else:
		print("Label no encontrado")
	
	if game_over_label:
		game_over_label.visible = false  # Se aseura de que Game Over esté oculto al inicio

func add_points():
	score += 10  # Incrementar los puntos
	if score_label:
		score_label.text = "Puntos: " + str(score)  # Actualizar el label de los puntos en pantalla
	
	# Verificar si los puntos alcanzaron 200, es decir 20 kills
	if score >= 200:
		end_level()  # Finalizar el nivel

func end_level():
	if game_over_label:
		game_over_label.text = "¡Nivel Completado!"  # Mostrar mensaje de finalización
		game_over_label.visible = true  # Hacer visible el Game Over

func _on_timer_timeout():
	# Instancia un enemigo y ponlo en una posición aleatoria
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(randi() % 800, -50)  # Coloca al enemigo en una posición aleatoria en la parte superior
	add_child(enemy)  # Añadir el enemigo a la escena
