extends NodeState

@export var player: Player
@export var animation_player: AnimatedSprite2D
@export var hit_collision_shape: CollisionShape2D

@export var hit_collider_offset: int = 9

func _ready() -> void:
	hit_collision_shape.disabled = true
	hit_collision_shape.position = Vector2(0, 0)

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transitions() -> void:
	if !animation_player.is_playing():
		transition.emit("Idle")

func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		animation_player.play("Chopping_back")
	elif player.player_direction == Vector2.DOWN:
		animation_player.play("Chopping_front")
	elif player.player_direction == Vector2.LEFT:
		animation_player.play("Chopping_left")
	elif player.player_direction == Vector2.RIGHT:
		animation_player.play("Chopping_right")

	hit_collision_shape.disabled = false
	hit_collision_shape.position = player.player_direction * hit_collider_offset

func _on_exit() -> void:
	animation_player.stop()
	hit_collision_shape.disabled = true