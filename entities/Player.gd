extends RigidBody3D


var flap_thrust := 50.0
var roll_sensitivity := 0.002
var pitch_sensitivity := 0.002
var steering_pos : int = 0
var pitch_pos : int = 0
var updraft : float = 0.0
var cross_sections := Vector3(2.0, 50.0, 0.01)
var baby_scene := preload("res://entities/Baby.tscn")


func _process(_delta) -> void:
	var amount : float = %FlapTimer.time_left / %FlapTimer.wait_time
	%ShoulderL.rotation.z = TAU/4 * amount
	%ShoulderR.rotation.z = -TAU/4 * amount


func _physics_process(_delta) -> void:
	if Input.is_action_pressed("flap") and %FlapTimer.is_stopped():
		%FlapTimer.start()
		%FlapSFX.play()
		# we want flapping to primarily push absolute-up, but also local-up and local-forward
		var flap_vector := 2*Vector3.UP + transform.basis.y - transform.basis.z
		apply_central_impulse(flap_thrust * flap_vector.normalized())
	if steering_pos != 0:
		rotate_object_local(Vector3.FORWARD, steering_pos * roll_sensitivity)
		steering_pos = 0
	if pitch_pos != 0:
		rotate_object_local(Vector3.RIGHT, pitch_pos * pitch_sensitivity)
		pitch_pos = 0

	var flap_drag_modifier : float = ((%FlapTimer.wait_time - %FlapTimer.time_left) / %FlapTimer.wait_time)
	var local_velocity := (linear_velocity + updraft*Vector3.DOWN) * transform.basis
	var vel_factor := -1 * local_velocity.sign() * local_velocity * local_velocity
	var local_drag := vel_factor * cross_sections * flap_drag_modifier
	var drag := transform.basis * local_drag
	apply_central_force(drag)
	
	# Sanity check in case flight system explodes
	if linear_velocity.length_squared() > 10000:
		print("Overly large speed!  HAX!")
		linear_velocity.clamp(Vector3(-30, -30, -30), Vector3(30, 30, 30))

	if Input.is_action_just_pressed("drop_baby"):
		var baby : RigidBody3D = baby_scene.instantiate()
		baby.position = position + 0.5*Vector3.DOWN
		baby.linear_velocity = linear_velocity
		get_parent().add_child(baby)


func _input(event) -> void:
	if event is InputEventMouseMotion:
		steering_pos += event.relative.x
		pitch_pos += event.relative.y
