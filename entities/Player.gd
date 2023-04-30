extends RigidBody3D


var lift_ratio := 2.0
var thrust := 100.0
var braking := 200.0
var roll_sensitivity := 0.002
var pitch_sensitivity := 0.002
var steering_pos : int = 0
var pitch_pos : int = 0
var cross_sections := Vector3(1.0, 50.0, 0.1)
var baby_scene := preload("res://entities/Baby.tscn")

func _physics_process(_delta):
	if Input.is_action_pressed("accelerate"):
		apply_central_force(-thrust * transform.basis.z)
	if Input.is_action_pressed("decelerate"):
		apply_central_force(braking * transform.basis.z)
	if steering_pos != 0:
		rotate_object_local(Vector3.FORWARD, steering_pos * roll_sensitivity)
		steering_pos = 0
	if pitch_pos != 0:
		rotate_object_local(Vector3.RIGHT, pitch_pos * pitch_sensitivity)
		pitch_pos = 0

	var local_velocity := linear_velocity * transform.basis
	var vel_factor := -1 * local_velocity.sign() * local_velocity * local_velocity
	var local_drag := vel_factor * cross_sections
	var drag := transform.basis * local_drag
	apply_central_force(drag)

	if Input.is_action_just_pressed("drop_baby"):
		var baby : RigidBody3D = baby_scene.instantiate()
		baby.position = position + 0.5*Vector3.DOWN
		baby.linear_velocity = linear_velocity
		get_parent().add_child(baby)


func _input(event):
	if event is InputEventMouseMotion:
		steering_pos += event.relative.x
		pitch_pos += event.relative.y
