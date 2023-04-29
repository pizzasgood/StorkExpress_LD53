extends PopupPanel


@onready var resume_button : Button = find_child("ResumeButton")


func _on_ResumeButton_pressed() -> void:
	visible = false


func _ready() -> void:
	visible = false
	resume_button.connect("pressed", Callable(self, "_on_ResumeButton_pressed"))
