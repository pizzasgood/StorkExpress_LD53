extends CenterContainer


@onready var quit_button : Button = find_child("QuitButton")


func _on_QuitButton_pressed() -> void:
	visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://TitleScreen.tscn")


func victory(time, babies, flaps) -> void:
	visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	quit_button.grab_focus()
	get_tree().paused = true
	%Time.text = "%0.2f" % time
	%Flaps.text = "%s" % flaps
	%Babies.text = "%s" % babies
