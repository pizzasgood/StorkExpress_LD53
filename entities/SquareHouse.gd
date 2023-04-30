extends StaticBody3D

const roof_colors := [
	"#888888",
	"#886644",
	"#444444",
]

const body_colors := [
	"#FF8888",
	"#FFFF88",
	"#88FF88",
	"#88FFFF",
	"#8888FF",
	"#FF88FF",
]

func _ready() -> void:
	%CollisionShape3D.make_convex_from_siblings()
	var roof_mat := StandardMaterial3D.new()
	var body_mat := StandardMaterial3D.new()
	roof_mat.albedo_color = roof_colors.pick_random()
	body_mat.albedo_color = body_colors.pick_random()
	%Roof.set_surface_override_material(0, roof_mat)
	%Body.set_surface_override_material(0, body_mat)

func _exit_tree() -> void:
	%Roof.set_surface_override_material(0, null)
	%Body.set_surface_override_material(0, null)
