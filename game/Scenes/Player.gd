extends CharacterBody3D

#bacir variables
var gravity = -30;
var max_speed = 8;
var mouse_sensivity = 0.002;

#gun variables


#function
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);


func get_input():
	var input_dir = Vector3();
	if Input.is_action_pressed("move_forward"):
		input_dir += -global_transform.basis.z;
	if Input.is_action_pressed("move_back"):
		input_dir -= -global_transform.basis.z;
	if Input.is_action_pressed("strafe_left"):
		input_dir -= global_transform.basis.x;
	if Input.is_action_pressed("strafe_right"):
		input_dir += global_transform.basis.x;
	input_dir = input_dir.normalized(); #add to cancel strafe running
	return input_dir
		
		
func _unhandled_input(event):
	pass
	
func _physics_process(delta):
	#gravity
	velocity.y += gravity*delta;
	var desired_velocity = get_input() * max_speed;
	velocity.x = desired_velocity.x;
	velocity.z = desired_velocity.z;
	move_and_slide();
	
	
func change_weapon(weapon):
	pass
	
func _process(delta):
	pass
