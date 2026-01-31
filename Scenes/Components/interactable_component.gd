class_name InteractableComponent
extends Area2D

signal interactable_entered
signal interactable_exited


func _on_body_exited(body: Node2D) -> void:
	interactable_exited.emit()

func _on_body_entered(body: Node2D) -> void:
	interactable_entered.emit()
