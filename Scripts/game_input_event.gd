class_name GameInputEvent

static var direction: Vector2

static func movement_input() -> Vector2:
	direction = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	return direction

static func is_moving_input() -> bool:
	return direction != Vector2.ZERO

static func use_tool_input() -> bool:
	return Input.is_action_just_pressed("hit")