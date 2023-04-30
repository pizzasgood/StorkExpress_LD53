extends Area3D


@export var windspeed := 5.0


func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		body.updraft += windspeed


func _on_body_exited(body) -> void:
	if body.is_in_group("player"):
		body.updraft -= windspeed
