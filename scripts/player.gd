extends Area2D

@export var speed = 400

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	var left_top = Vector2($CollisionShape2D.shape.radius, $CollisionShape2D.shape.radius)
	var bottom_right = screen_size - left_top
	position = position.clamp(left_top, bottom_right)
	position += velocity * delta
	
