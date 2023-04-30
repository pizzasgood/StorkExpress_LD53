extends Area3D


func _on_body_entered(body) -> void:
	if visible and body.is_in_group("babies"):
		visible = false
		add_to_group("complete_targets")
		remove_from_group("incomplete_targets")
		%SFX.play()
