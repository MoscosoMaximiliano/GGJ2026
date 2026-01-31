extends Sprite2D
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

@export var log_scene: PackedScene = preload("res://Scenes/Objects/Trees/log_item.tscn")
@export var log_count: int = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)


func on_hurt(damage: int) -> void:
	damage_component.apply_damage(damage)
	material.set_shader_parameter("shake_intensity", 2.0)
	await get_tree().create_timer(.5).timeout
	material.set_shader_parameter("shake_intensity", 0.0)

func on_max_damage_reached() -> void:
	print("Max damage reached, tree destroyed")
	call_deferred("instantiate_logs")
	queue_free()


func instantiate_logs() -> void:
	for i in range(log_count):
		var log_item = log_scene.instantiate() as Node2D
		log_item.global_position = global_position + Vector2(randf_range(-3, 3), randf_range(-3, 3))
		get_parent().add_child(log_item)