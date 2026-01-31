class_name HurtComponent
extends Area2D

@export var tool_to_hurt: DataTypes.Tools = DataTypes.Tools.None

signal hurt

func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent

	if hit_component.tool_to_hit == tool_to_hurt:
		hurt.emit(hit_component.hit_damage)
