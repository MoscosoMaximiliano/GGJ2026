extends NodeState

@export var player: Player
@export var animation_player: AnimatedSprite2D
@export var speed: float = 100.0

var direction: Vector2 = Vector2.ZERO

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	direction = GameInputEvent.movement_input()

	if direction == Vector2.UP:
		animation_player.play("Walk_back")
	elif direction == Vector2.DOWN:
		animation_player.play("Walk_front")
	elif direction == Vector2.LEFT:
		animation_player.play("Walk_left")
	elif direction == Vector2.RIGHT:
		animation_player.play("Walk_right")

	if direction != Vector2.ZERO:
		player.player_direction = direction

	player.velocity = direction * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !GameInputEvent.is_moving_input():
		print("Transitioning to Idle")
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animation_player.stop()
