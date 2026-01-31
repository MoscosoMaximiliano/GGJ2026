extends StaticBody2D

@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	interactable_component.interactable_entered.connect(on_interactable_entered)
	interactable_component.interactable_exited.connect(on_interactable_exited)

func on_interactable_entered() -> void:
	animated_sprite.play("open_door")
	collision_layer = 2

func on_interactable_exited() -> void:
	animated_sprite.play("close_door")
	collision_layer = 1