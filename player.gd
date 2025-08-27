extends CharacterBody2D

const SPEED = 300  # Velocidad de la nave

@onready var bullet_scene = preload("res://Bullet.tscn")
@onready var bullet_spawn = $BulletSpawn  # Obtiene el Marker2D

func _process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	velocity = direction.normalized() * SPEED
	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_accept"):  # "Espacio" por defecto
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.position = bullet_spawn.global_position  # Usa el Marker2D como punto de disparo
	get_parent().add_child(bullet)
