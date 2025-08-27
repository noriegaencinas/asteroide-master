extends Area2D

@onready var main_script = get_node("/root/Main")  # Referencia al script principal

const SPEED = -600  # Velocidad de la bala

func _ready():
	# Usar Callable correctamente para conectar la señal
	self.body_entered.connect(_on_body_entered)  # Conectar la señal body_entered a la función _on_body_entered

func _process(delta):
	position.y += SPEED * delta  # Mueve la bala hacia arriba

	if position.y < 0:  # Si sale de la pantalla, destruir
		queue_free()

# Función para manejar la colisión
func _on_body_entered(body):
	if body.is_in_group("enemies"):  # Si colisiona con un enemigo
		body.take_damage()  # Llamar a take_damage() en el enemigo
		queue_free()  # Destruir la bala
