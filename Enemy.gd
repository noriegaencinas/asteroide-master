extends CharacterBody2D

@onready var main_script = get_node("/root/Main")  # Referencia al script principal

const SPEED = 100
var health = 3  # Recibe 3 disparos antes de morir

func _ready():
	add_to_group("enemies")  # Agregar el nodo al grupo "enemies"

func _process(delta):
	position.y += SPEED * delta  # Mueve al enemigo hacia abajo
	if position.y > 600:  # Si sale de la pantalla, desaparecer
		queue_free()

func take_damage():
	health -= 1
	if health <= 0:
		main_script.add_points()  # Llamamos a la función add_points() cuando el enemigo muere
		queue_free()  # Destruir enemigo al recibir 3 disparos

# Función que se llama cuando el enemigo colisiona con una bala
func _on_body_entered(body):
	if body.is_in_group("bullets"):  # Si el objeto con el que colide es una bala
		take_damage()  # Llamar a take_damage() para reducir la salud
		body.queue_free()  # Destruir la bala
