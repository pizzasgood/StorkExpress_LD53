extends RigidBody3D

const head_colors := [
	"#FFEEDD",
	"#DD8866",
	"#444411",
]

const body_colors := [
	"#FFBBBB",
	"#FFFFBB",
	"#BBFFBB",
	"#BBFFFF",
	"#BBBBFF",
	"#FFBBFF",
]

func _ready() -> void:
	var head_mat := StandardMaterial3D.new()
	var body_mat := StandardMaterial3D.new()
	head_mat.albedo_color = head_colors.pick_random()
	body_mat.albedo_color = body_colors.pick_random()
	%HeadMesh.set_surface_override_material(0, head_mat)
	%BodyMesh.set_surface_override_material(0, body_mat)

func _exit_tree() -> void:
	%HeadMesh.set_surface_override_material(0, null)
	%BodyMesh.set_surface_override_material(0, null)
