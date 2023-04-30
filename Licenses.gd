extends VBoxContainer


@export var header_color := Color("#f79122")


func _ready() -> void:
	var licenses := Engine.get_license_info()
	for license in licenses:
		var button := Button.new()
		button.text = license
		add_child(button)
		
		var popup := PopupPanel.new()
		popup.size.x = 800 #TODO: these shouldn't be hardcoded!
		popup.size.y = 600
		add_child(popup)
		button.pressed.connect(popup.popup_centered)
		
		var scroll := ScrollContainer.new()
		popup.add_child(scroll)
		
		var vbox := VBoxContainer.new()
		scroll.add_child(vbox)
		
		var header := Label.new()
		header.text = license
		header.add_theme_color_override('font_color', header_color)
		vbox.add_child(header)
		vbox.add_child(HSeparator.new())
		
		var label := Label.new()
		label.text = licenses[license]
		vbox.add_child(label)
