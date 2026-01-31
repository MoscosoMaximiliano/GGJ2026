extends NodeState

@export var player: Player
@export var animation_player: AnimatedSprite2D

func _on_process(_delta: float) -> void:

	if player.player_direction == Vector2.UP:
		animation_player.play("Idle_back")
	elif player.player_direction == Vector2.DOWN:
		animation_player.play("Idle_front")
	elif player.player_direction == Vector2.LEFT:
		animation_player.play("Idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animation_player.play("Idle_right")

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transitions() -> void:
	GameInputEvent.movement_input()
	if GameInputEvent.is_moving_input():
		print("Transitioning to Walk")
		transition.emit("Walk")
	
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvent.use_tool_input():
		print("Transitioning to Chopping")
		transition.emit("Chopping")
	
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvent.use_tool_input():
		print("Transitioning to Tilling")
		transition.emit("Tilling")
	
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvent.use_tool_input():
		print("Transitioning to Watering")
		transition.emit("Watering")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animation_player.stop()
