extends VBoxContainer


@export var header_color := Color("#f79122")
@export var body_color := Color("#aaaaaa")


func _ready() -> void:
	var remaining := len(Engine.get_copyright_info())
	for component in Engine.get_copyright_info():
		var header := Label.new()
		header.text = "%s:" % component['name']
		header.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		header.add_theme_color_override('font_color', header_color)
		add_child(header)

		for part in component['parts']:
			var labels := []
			for copyright in part['copyright']:
				var label := Label.new()
				label.text = "© %s" % copyright
				labels.append(label)
			var license := Label.new()
			license.text = "License: %s" % part['license']
			labels.append(license)
			for label in labels:
				label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
				label.add_theme_color_override('font_color', body_color)
				add_child(label)

		remaining -= 1
		if remaining > 0:
			add_child(HSeparator.new())
