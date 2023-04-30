extends CenterContainer


func _on_QuitButton_pressed() -> void:
	visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://TitleScreen.tscn")


func victory(time, babies) -> void:
	visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
	%Message.text = "It took you %0.2f seconds and you dropped %s extra babies!" % [time, babies]
